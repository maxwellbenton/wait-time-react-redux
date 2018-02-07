class Store < ApplicationRecord
  has_many :wait_times
  has_many :users, through: :wait_times
  has_many :store_comments
  has_many :comments, through: :store_comments

  def self.populate(type, lat, lng)

    next_page = true
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?location=" + lat + "," + lng + "&radius=50000&type=" + type + "&key=AIzaSyBOSq8TtBwYaF-EgPDUGP07BNtEg3HlydE"
    json = RestClient.get url
    while next_page

      results = JSON.parse(json)['results']
      results.each_with_index { |place, i|
        Store.find_or_create_by(
          name: bar["name"],
          address: bar["formatted_address"],
          lat: bar["geometry"]["location"]["lat"].to_f,
          lng: bar["geometry"]["location"]["lng"].to_f
        )
      }

      if JSON.parse(json)['next_page_token']
        url = "https://maps.googleapis.com/maps/api/place/textsearch/json?pagetoken=" + JSON.parse(json)['next_page_token'] + "&key=AIzaSyBOSq8TtBwYaF-EgPDUGP07BNtEg3HlydE"

        json = RestClient.get url
      else
        next_page = false
      end
    end
  end

end
