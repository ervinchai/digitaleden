class Users::SessionsController < Devise::SessionsController
  def new
    render inertia: 'auth/Login'
  end
end
