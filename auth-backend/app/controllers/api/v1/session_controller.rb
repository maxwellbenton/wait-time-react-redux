class Api::V1::SessionController < ApplicationController

  def create
    lat = request.headers['lat']
    lng = request.headers['lng']
    types = ["store", "department_store", "clothing_store", "bakery", "book_store", "bus_station", "bank", "cafe", "convenience_store", "food", "grocery_or_supermarket", "home_goods_store", "train_station", "subway_station", "restaurant", "post_office", "pharmacy", "pet_store", "meal_takeaway", "local_government_office", "hospital"]


    @stores = Store.all.sample(30)
    @store_comments = @stores.map{|store| store.store_comments}.flatten
    @wait_times = @stores.map{|store| store.wait_times}.flatten

    if current_user
      render json: { user: UserSerializer.new(current_user), stores: @stores, store_comments: @store_comments, wait_times: @wait_times  }, status: 200
    else
      render json: { stores: @stores }, status: 206
    end


  end

end
