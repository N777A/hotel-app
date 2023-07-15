class UsersController < ApplicationController
  def account
    @user = current_user
  end
  
  def profile
    @user = current_user
  end


  def edit_profile 
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      flash[:ok] = '更新しました'
      redirect_to users_profile_path
    else 
      flash.now[:alert] = '更新できませんでした'
      render :edit_profile
    end
  end

private

def user_params
  params.require(:user).permit(:name, :intro, :image)
end
end


