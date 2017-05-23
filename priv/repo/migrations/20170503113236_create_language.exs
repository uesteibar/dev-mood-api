defmodule TwitterDevMood.Repo.Migrations.CreateLanguage do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :name, :string
      add :hashtag, :string
      add :mood, :integer, default: 0
      add :occurrences, :integer, default: 0

      timestamps()
    end

    create unique_index(:languages, [:name])
    create unique_index(:languages, [:hashtag])
  end
end
