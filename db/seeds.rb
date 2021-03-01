require "net/http"
require "open-uri"
require "json"
require "faker"

#Make Nonprofits
URL = "https://projects.propublica.org/nonprofits/api/v2/search.json?q=cats"

def get_nonprofits
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
end

i = 0
5.times do
  nonprofit = get_nonprofits["organizations"][i]
  Nonprofit.create(name: nonprofit["name"], city: nonprofit["city"])
  i += 1
end

#Make volunteers
10.times do
  Volunteer.create(
    name: Faker::FunnyName.name
  )
end

#Make volunteer engagements
i = 0
Volunteer.all.each do |volunteer|
  2.times do
    engagement = volunteer.volunteer_engagements.new(date: Faker::Date.backward(days: 30)) #must have both volunteer_id and nonprofit_id to save
    engagement.nonprofit = Nonprofit.all[i]
    engagement.save
  end
  i += 1
end