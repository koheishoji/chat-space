class UsersController < ApplicationController
  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      redirect_to controller: :messages, action: :index
    end
  end

  def update
    user = current_user
    user.update update_user_params
    redirect_to controller: :messages, action: :index
  end

  protected
  def update_user_params
    params.require(:user).permit(:name)
  end
end
