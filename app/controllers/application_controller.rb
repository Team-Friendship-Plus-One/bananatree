class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
<<<<<<< HEAD
  protect_from_forgery with: :exception

  include ApplicationHelper
  include CitiesHelper
=======
protect_from_forgery with: :exception
# before_filter :authenticate_user!

def after_sign_in_path_for(resource_or_scope)
   if current_user
    if current_user.email == ""
        finish_signup_path(current_user)
      else
      root_path
    end
    else
       new_user_session_path
  end
end
>>>>>>> bcf2654e56a6bb9911cb544870322a62061124b0
end
