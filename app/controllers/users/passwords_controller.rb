class Users::PasswordsController < Devise::PasswordsController
  def new
    render inertia: 'auth/ForgotPassword'
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      redirect_to after_sending_reset_password_instructions_path_for(resource_name)
    else
      render inertia: 'auth/ForgotPassword', props: { errors: resource.errors.messages }, status: :unprocessable_entity
    end
  end

  def edit
    render inertia: 'auth/ResetPassword'
  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message!(:notice, flash_message)
        resource.after_database_authentication
        sign_in(resource_name, resource)
      else
        set_flash_message!(:notice, :updated_not_active)
      end
      redirect_to after_resetting_password_path_for(resource)
    else
      set_minimum_password_length
      render inertia: 'auth/ResetPassword', props: { errors: resource.errors.messages }, status: :unprocessable_entity
    end
  end
end
