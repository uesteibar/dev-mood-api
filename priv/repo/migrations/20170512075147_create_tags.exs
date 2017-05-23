defmodule TwitterDevMood.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :tag, :string

      timestamps()
    end

    create table(:languages_tags) do
      add :language_id, references(:languages)
      add :tag_id, references(:tags)
    end
  end
end
