class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def signed_in
    unless signed_in?
      flash[:notice] = "You must be signed in to edit, please sign in."
      redirect_to new_user_session_path
      return false
    end
  end
end
