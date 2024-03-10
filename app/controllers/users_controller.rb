class UsersController < ApplicationController
  
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    session["user_id"] = @user["id"]
    redirect_to "/places"
  end
end
