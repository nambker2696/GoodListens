class RegistrationsController < Devise::RegistrationsController

  protected
  
  def after_update_path_for(resource)
    user_path(I18n.locale.to_s, resource)
  end

  def update_resource(resource, params)
    if resource.encrypted_password.blank? # || params[:password].blank?
      resource.email = params[:email] if params[:email]
      if !params[:password].blank? && params[:password] == params[:password_confirmation]
        logger.info "Updating password"
        resource.password = params[:password]
        resource.save
      end
      if resource.valid?
        resource.update_without_password(params)
      end
    else
      resource.update_with_password(params)
    end
  end
end
