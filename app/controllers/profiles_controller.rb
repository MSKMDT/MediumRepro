class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update]
  skip_before_action :check_profile_exists, :only => [:new, :create]
  before_action :authenticate_user!

  def new
  	
  end

  def create
  	
  end

  def show
  end

  def edit
  end

  private

  def profile_params
  	params.require(:profile).permit(:username, :picture)
  end
  def find_profile
  	@profile = Profile.find(params[:user_id])
  end

end
