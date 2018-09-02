defmodule Chat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :message, :string
      add :published_at, :datetime

      timestamps()
    end

  end
end
