defmodule TwitterDevMood.Keyword do
  use TwitterDevMood.Web, :model

  schema "keywords" do
    field :keyword, :string
    belongs_to :language, TwitterDevMood.Language

    timestamps()
  end

  def changeset(struct, %{} = params) do
    cast(struct, params, [:keyword, :language_id])
    |> validate_required([:keyword, :language_id])
    |> unique_constraint(:keyword)
  end
end
