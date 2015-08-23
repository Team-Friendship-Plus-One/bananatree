class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    @campaign = Campaign.find_by(:id => params[:campaign_id])
  end

  # GET /donations/new
  def new
    @campaign = Campaign.find_by(:id => params[:campaign_id])
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
    @campaign = Campaign.find_by(:id => params[:campaign_id])
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    @donation.campaign_id = params[:campaign_id]
    if user_signed_in?
      @donation.user_id = current_user.id
    end
    @campaign = Campaign.find_by(:id => params[:campaign_id])

    respond_to do |format|
      if @donation.save
        format.html { redirect_to [@campaign, @donation], notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: [@campaign, @donation] }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to campaign_donation_path(@donation.campaign_id, @donation), notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: [@campaign, @donation] }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to campaign_donations_path, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:amount)
    end
end
