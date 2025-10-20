class Users::RegistrationsController < Devise::RegistrationsController
  def new
    render inertia: 'auth/SignUp'
  end
end
