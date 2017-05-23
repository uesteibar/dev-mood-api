defmodule TwitterDevMood.Language do
  use TwitterDevMood.Web, :model

  import Ecto.Query

  alias TwitterDevMood.Repo
  alias TwitterDevMood.Keyword
  alias TwitterDevMood.Statistic
  alias TwitterDevMood.Tag
  alias TwitterDevMood.Language

  schema "languages" do
    field :name, :string
    field :type, :string
    field :mood, :integer
    field :occurrences, :integer
    has_many :keywords, Keyword
    has_many :statistics, Statistic
    many_to_many :tags, Tag, join_through: "languages_tags"

    field :mood_avg, :float, virtual: true

    timestamps()
  end

  def changeset(struct, %{} = params) do
    cast(struct, params, [:name, :type, :mood, :occurrences])
    |> validate_required([:mood, :occurrences])
    |> unique_constraint(:name)
  end

  def changeset_for_tags(struct, %{} = params) do
    cast(struct, params, [:tags])
  end

  def find_by_keyword(keyword, query \\ Language) do
    query
    |> has_keywords([keyword])
    |> Repo.one
  end

  def calculate_mood_avg(query \\ Language) do
    from l in query,
    select: %{ l | mood_avg: fragment("(CAST(? as float) / COALESCE(NULLIF(CAST(? as float), 0), 1)) as mood_avg", l.mood, l.occurrences) }
  end

  def count_occurrences(query \\ Language) do
    from l in query,
    select: %{ total_occurrences: sum(l.occurrences) }
  end

  def preload_keywords(query \\ Language) do
    from l in query,
    preload: :keywords
  end

  def preload_tags(query \\ Language) do
    from l in query,
    preload: :tags
  end

  def preload_statistics(query \\ Language) do
    from l in query,
    preload: :statistics
  end

  def has_keywords(query, keywords) do
    from l in query,
    join: k in assoc(l, :keywords),
    where: k.keyword in ^keywords,
    distinct: l.id
  end

  def has_tag(query, tags) do
    from l in query,
    join: t in assoc(l, :tags),
    where: t.tag in ^tags,
    distinct: l.id
  end
end
