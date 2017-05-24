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
      history: render_statistics(language.statistics),
      type: language.type,
      occurrences: language.occurrences,
      moodAvg: format_mood_avg(language.mood_avg),
    }
  end

  defp format_mood_avg(mood_avg), do: Float.round(mood_avg, 4)

  defp format_date(datetime) do
    datetime
    |> Ecto.DateTime.to_erl
    |> :calendar.datetime_to_gregorian_seconds
    |> Kernel.-(62167219200)
  end

  defp render_statistics(statistics) do
    TwitterDevMood.Api.StatisticView.render("index.json", %{statistics: statistics})
  end
end
