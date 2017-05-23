defmodule TwitterDevMood.Notifier.StatsUpdated do
  alias TwitterDevMood.Language
  alias TwitterDevMood.Repo

  def notify_languages do
    TwitterDevMood.Endpoint.broadcast(
      "stats:languages",
      "update",
      payload()
    )
  end

  defp payload do
    Language.count_occurrences
    |> Repo.all
    |> List.first
  end
end
