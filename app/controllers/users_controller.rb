class UsersController < ApplicationController
  before_action :set_user, only: [:finish_signup]
  # before_filter :authenticate_user!
  def index
  end

  # GET /users/:id.:format
  def profile
    # authorize! :read, @user
  end

  def show
    idx = 0
    @donations = []
    @total_donation = 0
    while idx < current_user.donations.length
      @donations.push(id: current_user.donations[idx].id, amount: current_user.donations[idx].amount, campaignId: current_user.donations[idx].campaign_id)
      @total_donation += current_user.donations[idx].amount
      idx += 1
    end
    @donations.each do |donation|
      puts donation[:amount]
    end
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup

    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [:first_name, :last_name, :location, :email ] # extend with your own params
      params.require(:user).permit(accessible)
    end
end