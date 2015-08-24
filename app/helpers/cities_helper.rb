module CitiesHelper

  def timezoneTime (timezone="Pacific")
    if timezone == "Pacific"
      Time.now
    elsif timezone == "Mountain"
      Time.now + (60*60*1)
    elsif timezone == "Central"
      Time.now + (60*60*2)
    elsif timezone == "Eastern"
      Time.now + (60*60*3)      
    elsif timezone == "Hawaii"
      Time.now - (60*60*3)
    elsif timezone == "Alaska"
      Time.now - (60*60*1)
    end
  end
end
