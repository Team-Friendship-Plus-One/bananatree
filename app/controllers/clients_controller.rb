class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @campaign = Campaign.where(:location => @client.location)
    # if there an existing campaign
    if @campaign.length != 0

      @campaign.each do |campaign|
        city = City.find_by(:city => campaign.location)
        # check if there is a current fund for that city today
        if campaign.deadline_date != timezoneTime(city.timezone)
          # if there is no fund for this date
          # create a fund for this date
          # if there was a previous fund from the previous day
          # rollover the extra funds if there are any
            excess = 0
            # this only works when there are campaigns in the array
            @campaign.each do |otherCamp|
              if ((otherCamp.deadline_date + 1) == timezoneTime(city.timezone)) && (otherCamp.current_total > otherCamp.funded)
                excess = otherCamp.current_total - otherCamp.funded
              end
            end
            countOfClients = Client.where(:location => campaign.location).count
            newCampaign = Campaign.create({:title => (city.city.to_s + "Campaign"), 
                             :deadline_date => timezoneTime(city.timezone).to_date, 
                             :goal => (60*countOfClients), 
                             :funded => false, 
                             :current_total => excess, 
                             :location => campaign.location})
        end

      end

    else
      city = City.find_by(:city => @client.location)
      excess = 0
      countOfClients = 1
      newCampaign = Campaign.create({:title => (city.city.to_s + "Campaign"), 
                       :deadline_date => timezoneTime(city.timezone).to_date, 
                       :goal => (60*countOfClients), 
                       :funded => false, 
                       :current_total => excess, 
                       :location => @client.location})
    end


    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :bio, :location, :special_notes, :age, :gender, :picture, :goals, :campaign_id)
    end
end
