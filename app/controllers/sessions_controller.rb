class SessionsController < ApplicationController
  def new
  end

  def create
    
    # If the user exists AND password is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save user id in browser cache
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
