defmodule TwitterDevMood.Api.StatisticView do
  use TwitterDevMood.Web, :view

  def render("index.json", %{statistics: statistics}) do
    render_many(statistics, TwitterDevMood.Api.StatisticView , "show.json")
  end

  def render("show.json", %{statistic: statistic}) do
    %{
      timestamp: (statistic.inserted_at),
      moodAvg: format_mood_avg(statistic.mood_avg),
    }
  end

  defp format_mood_avg(mood_avg), do: Float.round(mood_avg, 4)

  defp format_date(datetime) do
    datetime
    |> Ecto.DateTime.to_erl
    |> :calendar.datetime_to_gregorian_seconds
    |> Kernel.-(62167219200)
  end
end
