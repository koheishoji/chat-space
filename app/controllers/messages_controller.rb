class MessagesController < ApplicationController
  def index
    @user = current_user
    @groups = [{name: "god", message: "god of god"},
               {name: "aaaaaaaaa", message: "aaaaaaa"},
               {name: "sample", message: "no message"},]
    @group = {name: "sample", menbers: ["seo", "neko"]}
    @messages = [{name: "seo", date: "2016/09/21 06:16:55", body: "Hello world!"},
      {name: "neko", date: "2016/09/22 06:16:55", body: "Good bye world!"},
      {name: "neko", date: "2016/09/23 06:16:55", body: "See you later!"}]
    @chat = ""
  end
end
