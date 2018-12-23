class ProfileController < ApplicationController
  def new
  @profile = Profile.new
  # @profile = current_user.profile.new(user_id: current_user.id)
  end
  
  def create
   @profile = Profile.new(profile_params)
  @profile.user_id = current_user.id
  @profile = @profile.save
  redirect_to user_path(current_user.id)
  end
  
  def edit
    @profile= Profile.find(current_user.profile.id)
  end
  
  def show
    @user = User.find(params[:id])
    @profile= Profile.find_by(user_id: params[:id])
  end
  
  def update
    @profile= Profile.find(current_user.profile.id)
    @profile.update(profile_params)
    redirect_to user_path, notice:"編集しました！"
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:profilepic, :introduction,:profilepic_cache, :birthday)
  end
end
