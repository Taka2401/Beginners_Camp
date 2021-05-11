class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   if resource.instance_of?(Admin)
     admin_camp_places_path
   elsif resource.instance_of?(User)
     camps_path
   else
     root_path
   end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
