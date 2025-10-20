class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  inertia_share do
    {
      flash: {
        notice: flash.notice,
        alert: flash.alert,
      },
      auth: {
        user: current_user ? { email: current_user.email } : nil
      }
    }
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end
