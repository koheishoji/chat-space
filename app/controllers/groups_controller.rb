class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: "グループが作成されました"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to group_messages_path(params[:id]), notice: "グループが変更されました"
    else
      render :edit
    end
  end

  private

    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end

end
