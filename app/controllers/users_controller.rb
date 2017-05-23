class UsersController < ApplicationController
  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def update
    if current_user.update update_user_params
      redirect_to root_path
    else
      render :edit
    end
  end

  protected
  def update_user_params
    params.require(:user).permit(:name)
  end
end
