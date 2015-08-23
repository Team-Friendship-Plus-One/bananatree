class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @cities = City.all
    # grab all existing campaigns for today
    @campaigns = Campaign.where(:deadline_date => timezoneTime().to_date)
    @existingCampaigns = []
    @cities.each do |city|
      # add all existing campaigns for today into a array
      @campaigns.each do |campaign|
        if city.city == campaign.location
          @existingCampaigns.push(campaign)
        end
      end

      # create campaigns for all cities that do not exist
      @campaigns.each do |campaign|
        campaignExists = false
        @existingCampaigns.each do |exist| 
          if campaign.location == exist.location
            campaignExists = true
          end
        end

        # if campaign does not exist and there is more than 1 client in that city create a camapaign
        @client = Client.where(:location => campaign.location)

        if campaignExists == false && @client.count != 0

          city = City.find_by(:city => campaign.location)
          countOfClients = @client.count
          Campaign.create({:title => (city.city.to_s + "Campaign"), 
                           :deadline_date => timezoneTime(city.timezone).to_date, 
                           :goal => (60*countOfClients), 
                           :funded => false, 
                           :current_total => excess, 
                           :location => campaign.location})
        end
      end


    end
    



  end

  def team
  end
end
