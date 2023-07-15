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
    # if @user.update
  end
end
