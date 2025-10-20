class Users::SessionsController < Devise::SessionsController
  def new
    render inertia: "auth/Login"
  end

  def create
    self.resource = warden.authenticate(auth_options)
    if resource
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      redirect_to after_sign_in_path_for(resource)
    else
      render inertia: "auth/Login", props: { errors: { email: "Invalid email or password." } }, status: :unprocessable_entity
    end
  end
end
