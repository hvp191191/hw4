class EntriesController < ApplicationController
  # belongs_to :places
  # belongs_to :users
  
  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    
    #if params[:entry] && params[:entry][:uploaded_image].present?
    @entry.uploaded_image.attach(params["uploaded_image"])
    #end

    @entry["place_id"] = params["place_id"]
    
    
    @entry["user_id"] = @current_user["id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
