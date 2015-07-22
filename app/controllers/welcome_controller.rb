class WelcomeController < ApplicationController
  before_action :authenticate_user!, :only => :secret
  skip_before_action :check_profile_exists, :only => [:index]
  
  def index
		@posts = Post.all.limit(5).order("created_at DESC")
	end

  def secret
  end
end
