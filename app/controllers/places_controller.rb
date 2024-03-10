class PlacesController < ApplicationController

  def index
    # if @current_user
    #   @sql = "SELECT places.* FROM places 
    #          JOIN entries ON places.id = entries.place_id 
    #           WHERE entries.user_id = #{@current_user.id}"
    #   if @sql 
    #     @places = ActiveRecord::Base.connection.execute(@sql)
    #   else 
    #     flast["alert"] = "No Entries Found"
    #   end 
    #   else
    #   # Handle no current user case
    #   redirect_to login_path, alert: "You must be logged in to see this page."
    # end
    if @current_user
      @places = Place.where({"user_id" => @current_user["id"]})
          
    else
      #Index.HTML is providing the output if user is not logged in
    end
  end
  
  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @current_user
      @entries = Entry.where({ "place_id" => @place["id"],"user_id" => @current_user["id"] })
    else
     #show.HTML is providing the output if user is not logged in
    end 
    end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place["user_id"] = current_user["id"]
    @place.save
    redirect_to "/places"
  end

end
