defmodule ChatWeb.PageView do
  use ChatWeb, :view

  def render("messages.json", %{messages: messages}) do
    %{
      messages: Enum.map(messages, &message_json/1)
    }
  end

  def message_json(message) do
    %{
      message: message.message,
      nae: message.name,
    }
  end
end
