class RegistrationsController < Devise::RegistrationsController

  protected
  
  def after_update_path_for(resource)
    user_path(I18n.locale.to_s, resource)
  end
end
