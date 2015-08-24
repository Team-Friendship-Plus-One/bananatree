class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper
  include CitiesHelper
# before_filter :authenticate_user!

  def after_sign_in_path_for(resource_or_scope)
     if current_user
      if current_user.email == ""
          finish_signup_path(current_user)
        else
        user_path(current_user)
      end
      else
         new_user_session_path
    end
  end
end
