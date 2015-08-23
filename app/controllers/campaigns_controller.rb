class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.order('created_at DESC')

  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @campaign = Campaign.find(params[:id])
  end

  def pay
    payment = Simplify::Payment.create({
        amount: params['donation-amount'].to_f * 100,
        token: params['simplifyToken'],
        description: 'Simplify Rails Example',
        currency: 'USD'})

    @message = payment['paymentStatus']
    campaignId = params[:campaignId][:id].to_i
    binding.pry
    currentCampaign = Campaign.find_by(:id => campaignId)
    currentCampaign.current_total = currentCampaign.current_total.to_d + params["donation-amount"].to_d
    currentCampaign.save

    if current_user != nil 
      newDonation = current_user.donations.new
    else
      newDonation = Donation.new
    end
      newDonation.amount = params["donation-amount"].to_d
      newDonation.campaign_id = campaignId
      newDonation.save

    redirect_to '/campaigns'
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:title, :deadline_date, :goal, :funded, :current_total, :location)
    end
end
