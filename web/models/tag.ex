defmodule TwitterDevMood.Tag do
  use TwitterDevMood.Web, :model

  alias TwitterDevMood.Repo
  alias TwitterDevMood.Tag

  schema "tags" do
    field :tag, :string
    many_to_many :languages, TwitterDevMood.Language, join_through: "languages_tags"

    timestamps()
  end

  def changeset(struct, %{} = params) do
    cast(struct, params, [:tag])
    |> validate_required([:tag])
    |> unique_constraint(:tag)
  end

  def find_by_tag(tag) do
    Tag
    |> where(tag: ^tag)
    |> Repo.one!
  end
end
