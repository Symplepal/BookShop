class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  def create
    super

    resource.purchases << Purchase.new(state: 'open')

    if resource.save
      resource.add_role :customer

    end
  end

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :address, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :address, :email, :password, :password_confirmation)
    end
  end

end