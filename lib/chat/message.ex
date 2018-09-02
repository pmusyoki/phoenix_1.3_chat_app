defmodule Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Chat.Message

  schema "messages" do
    field :message, :string
    field :name, :string
    field :published_at, :string

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:name, :message, :published_at])
    |> validate_required([:name, :message, :published_at])
  end

  def get_msgs(limit \\ 20) do
    Chat.Repo.all(Message, limit: limit)
  end
end
