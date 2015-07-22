class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update]
  skip_before_action :check_profile_exists, :only => [:new, :create]
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

   def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    if @profile.save
      redirect_to @profile, notice: "Awesome your profile is ready!"
    else 
      render 'new', notice: "Oops we need your profile picture and username to create your profile. Almost there!"
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Your profile was successfully updated"
    else
      render 'edit'
    end
  end

  private

  def profile_params
  	params.require(:profile).permit(:username, :picture)
  end
  def find_profile
  	@profile = Profile.find(params[:id])
  end

end
