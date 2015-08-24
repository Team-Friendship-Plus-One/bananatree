class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @cities = City.all
    # grab all existing campaigns for today
    @campaigns = Campaign.where(:deadline_date => timezoneTime().to_date)
    @existingCampaigns = []
    @cities.each do |city|
      # add all existing campaigns for today into a array
      campaignExists = false
      @campaigns.each do |campaign|
        if city.city == campaign.location
          campaignExists = true
        end
      end
      if campaignExists == true
        @existingCampaigns.push(city.city)
      end
    end

    # create campaigns for all cities that do not exist
    @cities.each do |city|
      campaignExists = false
      @existingCampaigns.each do |existingCity| 
        if city.city == existingCity
          campaignExists = true
        end
      end
      # if campaign does not exist and there is more than 1 client in that city create a camapaign
      @client = Client.where(:location => city.city)
      if campaignExists == false && @client.count != 0

        city = City.find_by(:city => city.city)
        countOfClients = @client.count
        Campaign.create({:title => (city.city.to_s + " Campaign"), 
                         :deadline_date => timezoneTime(city.timezone).to_date, 
                         :goal => (60*countOfClients), 
                         :funded => false, 
                         :current_total => 0, 
                         :location => city.city})
      end
    end
  end

  def team
  end
end
