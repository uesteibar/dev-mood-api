defmodule TwitterDevMood.Statistic do
  use TwitterDevMood.Web, :model

  schema "statistics" do
    field :mood_avg, :float
    belongs_to :language, TwitterDevMood.Language

    timestamps()
  end

  def changeset(struct, %{} = params) do
    cast(struct, params, [:mood_avg, :language_id])
    |> validate_required([:mood_avg, :language_id])
  end
end
