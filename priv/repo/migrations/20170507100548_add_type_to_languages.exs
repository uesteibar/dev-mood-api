defmodule TwitterDevMood.Repo.Migrations.AddTypeToLanguages do
  use Ecto.Migration

  def change do
    alter table(:languages) do
      add :type, :string, null: false
    end
  end
end
