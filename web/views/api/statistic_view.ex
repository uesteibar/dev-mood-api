defmodule TwitterDevMood.Api.StatisticView do
  use TwitterDevMood.Web, :view

  def render("index.json", %{statistics: statistics}) do
    render_many(statistics, TwitterDevMood.Api.StatisticView , "show.json")
  end

  def render("show.json", %{statistic: statistic}) do
    %{
      timestamp: format_date(statistic.inserted_at),
      moodAvg: format_mood_avg(statistic.mood_avg),
    }
  end

  defp format_mood_avg(mood_avg), do: Float.round(mood_avg, 4)

  defp format_date(datetime) do
    {:ok, date} = Ecto.DateTime.cast(datetime)

    Ecto.DateTime.to_date(date)
  end
end
