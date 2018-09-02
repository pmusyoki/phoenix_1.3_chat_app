defmodule ChatWeb.PageController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def messages(conn, _params) do
    render conn, "index.html"
    #messages = Chat.Message.get_msgs()
    #render conn, "messages.json", messages: messages
  end
end
