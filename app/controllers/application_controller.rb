class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_not_found
    render file: Rails.root.join("public", "404.html"),
      status: 404
  end

  protected
  
  def configure_permitted_parameters
    added_attrs = [:name, :email, :intro, :password, :password_confirmation,
      :remember_me, :gender, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
