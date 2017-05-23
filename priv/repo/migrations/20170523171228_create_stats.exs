defmodule TwitterDevMood.Repo.Migrations.CreateStats do
  use Ecto.Migration

  def change do
    create table(:statistics) do
      add :language_id, references(:languages)
      add :mood_avg, :float

      timestamps()
    end
  end
end
