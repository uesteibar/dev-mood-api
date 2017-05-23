defmodule TwitterDevMood.Api.LanguageView do
  use TwitterDevMood.Web, :view

  def render("index.json", %{languages: languages}) do
    %{
      collection: render_many(languages, TwitterDevMood.Api.LanguageView, "show.json"),
      totalOccurrences: Enum.reduce(languages, 0, &(&1.occurrences + &2))
    }
  end

  def render("show.json", %{language: language}) do
    %{
      id: language.id,
      name: language.name,
      keywords: Enum.map(language.keywords, &(&1.keyword)),
      type: language.type,
      occurrences: language.occurrences,
      moodAvg: (language.mood_avg) |> Float.round(4),
    }
  end
end
