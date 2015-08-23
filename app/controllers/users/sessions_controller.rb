class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
      # make an http request to digits api to get user information
    response = Typhoeus.get(params[:apiUrl], headers: { 'Authorization' => params[:authHeader] })
    binding.pry
    # if we get user information back, find a user with the given phone number
    puts response.body
    user_information = JSON.parse(response.body)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
