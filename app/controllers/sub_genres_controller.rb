class SubGenresController < ApplicationController
  load_and_authorize_resource
  # before_action :set_sub_genre, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @sub_genres = SubGenre.all
    respond_with(@sub_genres)
  end

  def show
    respond_with(@sub_genre)
  end

  def new
    @sub_genre = SubGenre.new
    respond_with(@sub_genre)
  end

  def edit
  end

  def create
    @sub_genre = SubGenre.new(sub_genre_params)
    @sub_genre.save
    respond_with(@sub_genre)
  end

  def update
    @sub_genre.update(sub_genre_params)
    respond_with(@sub_genre)
  end

  def destroy
    @sub_genre.destroy
    respond_with(@sub_genre)
  end

  private
    def set_sub_genre
      @sub_genre = SubGenre.find(params[:id])
    end

    def sub_genre_params
      params.require(:sub_genre).permit(:name, :genre_id)
    end
end
