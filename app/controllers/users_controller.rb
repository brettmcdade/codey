class UsersController < ApplicationController
	
  before_filter :authenticate_user!, :except => [:show, :index] 

  def show
    @user = User.find_by_name(params[:id])
	@user.profile ||= Profile.new
	@profile = @user.profile
	
#	@user.services ||= Service.new
#	@services = @user.services
	
	@title = @user.name
  end

end
