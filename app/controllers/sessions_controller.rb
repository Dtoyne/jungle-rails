class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie.
      # Keeps the user logged in when they navigate around Jungle.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login does not work, send back to login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
