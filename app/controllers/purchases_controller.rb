class PurchasesController < ApplicationController
  load_and_authorize_resource
  # before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

    if current_user.has_role? :admin
      @purchases = Purchase.where(state: 'closed')
    elsif current_user.has_role? :customer
      @purchases = Purchase.where(user: current_user, state: 'closed')
    end

    respond_with(@purchases)
  end

  def show
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "szammla"   # Excluding ".pdf" extension.
      end
    end
  end

  def new
    @purchase = Purchase.new
    respond_with(@purchase)
  end

  def edit
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.save
    respond_with(@purchase)
  end

  def add_to_cart
    book = Book.find(params[:book])

    not_enough_book_error = false

      inventory = BookStore.where("book_id = ? AND quantity >= ? ", book.id, 1).first
      if inventory.nil?
        not_enough_book_error = true
      end

    if not_enough_book_error
      render action: :edit
    else
      book_purchase = BookPurchase.where(purchase: current_user.cart, book: book).first
      if book_purchase.nil?
        BookPurchase.create!(purchase: current_user.cart, book: book, quantity: 1)
      else
        book_purchase.quantity = book_purchase.quantity + 1
        book_purchase.save!
      end
      redirect_to edit_purchase_path(@purchase)
    end
  end

  def update
    not_enough_book_error = false

   params[:purchase][:book_purchases_attributes].each do |key, book_purchase|
      inventory = BookStore.where("book_id = ? AND quantity >= ? ", book_purchase[:book_id], book_purchase[:quantity]).first
      if inventory.nil?
        not_enough_book_error = true
      end
    end

    if not_enough_book_error
      render action: :edit
    else
      @purchase.update(purchase_params)
      if params[:submit_button] == 'Lezaras'
        @purchase.book_purchases.each do |book_purchase|
          inventory = BookStore.where("book_id = ? AND quantity >= ? ", book_purchase.book_id, book_purchase.quantity).first
          inventory.quantity -= book_purchase.quantity
          inventory.save!
        end

        @purchase.state = 'closed'
        if @purchase.save!
          current_user.purchases << Purchase.new(state: 'open')
          current_user.save!
        end

      end
      redirect_to edit_purchase_path(@purchase)
    end

  end

  def destroy
    @purchase.destroy
    respond_with(@purchase)
  end

  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:delivery_method, :state, book_purchases_attributes: [:id, :book_id, :purchase_id, :quantity, :_destroy])
    end
end
