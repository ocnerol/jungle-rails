class SessionsController < ApplicationController
  def new
  end

  def create
    #if the user exists AND the password entered is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # save the user id inside the browser cookie; this is how we keep the user
      # logged in when they navigate around our website
      session[:user_id] = user.id
      redirect_to :root
      else
      redirect_to :login
      end
  end
  # def create
  #   user = User.find_by_email(params[:email])
  #   #if the user exists AND the password entered is correct
  #   if user && user.authenticate(params[:password])
  #     # save the user id inside the browser cookie; this is how we keep the user
  #     # logged in when they navigate around our website
  #     session[:user_id] = user.id
  #     redirect_to :root
  #     else
  #     redirect_to :login
  #     end
  # end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
