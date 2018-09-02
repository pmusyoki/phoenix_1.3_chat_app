defmodule Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias Chat.Room

  schema "rooms" do
    field :name, :string
    field :enabled, :boolean

    timestamps()
  end

  @doc false
  def changeset(%Room{} = room, attrs) do
    room
    |> cast(attrs, [:name, :enabled])
    |> validate_required([:name])
  end

  def get_msgs(limit \\ 10) do
    Chat.Repo.all(Room, limit: limit)
  end

  def create_message do
    
  end
end
