defmodule :"Elixir.Chat.Repo.Migrations.AddDisplayTimeToMessages:datetime" do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      add :published_at, :datetime
    end
  end
end
