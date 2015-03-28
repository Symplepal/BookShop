class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  def create
    super

    if resource.save
      resource.has_role :costumer
    end
  end

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :address, :email)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :address, :email)
    end
  end

end