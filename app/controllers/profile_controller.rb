class ProfileController < ApplicationController

  def index
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end
  
  def update
    @profile = current_user.profile
    if @profile.update(profile_params) 
      render 'index'
    else
      flash[:notice] = "SOmething went wrong please try again"
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :avatar)
    end

  
end
