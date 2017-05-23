defmodule TwitterDevMood.Repo.Migrations.CreateKeywords do
  use Ecto.Migration

  def change do
    create table(:keywords) do
      add :language_id, references(:languages)
      add :keyword, :string

      timestamps()
    end

    alter table(:languages) do
      remove :hashtag
    end
  end
end
