class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @mgroup = Group.find(params[:group_id])
    @messages = [{name: "seo", date: "2016/09/21 06:16:55", body: "Hello world!"},
      {name: "neko", date: "2016/09/22 06:16:55", body: "Good bye world!"},
      {name: "neko", date: "2016/09/23 06:16:55", body: "See you later!"}]
    @chat = ""
  end
end
