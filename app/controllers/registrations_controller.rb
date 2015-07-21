class RegistrationsController < Devise::RegistrationsController
  layout 'static_pages'
  protected

  def after_sign_up_path_for(resource)
    dashboard_path
  end
end