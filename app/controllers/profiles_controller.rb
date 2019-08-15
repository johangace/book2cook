class ProfilesController < ApplicationController
  before_action :set_profile
  before_action :verify_profile_ownership, except: [:show]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile updated"
    else
      flash[:alert] = "#{@profile.errors.full_messages.to_sentence.capitalize}."
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def verify_profile_ownership
    return redirect_to root_path, alert: "Unauthorized" unless @profile.user == current_user
  end

  def profile_params
    params.require(:profile).permit(:name, :avatar, :city, :phone_number, :zipcode, :street, :state)
  end
end
