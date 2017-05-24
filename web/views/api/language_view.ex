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
      statistics: Enum.map(language.statistics, fn statistic ->
        %{
          date: statistic.inserted_at,
          moodAvg: format_mood_avg(statistic.mood_avg),
        }
      end),
      type: language.type,
      occurrences: language.occurrences,
      moodAvg: format_mood_avg(language.mood_avg),
    }
  end

  defp format_mood_avg(mood_avg), do: Float.round(mood_avg, 4)
end
