class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = Message.where(group_id: params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]), notice:  "メッセージが送信されました" }
        format.json
      end
    else
      redirect_to group_messages_path(params[:group_id]), alert: "メッセージを入力してください"
    end
  end

  def auto
    @messages = Message.where("id>=?", params[:last_id]).where(group_id: params[:group_id])
  end

  private

    def message_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end
end
