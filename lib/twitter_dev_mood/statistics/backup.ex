defmodule TwitterDevMood.Statistics.Backup do
  alias TwitterDevMood.Language
  alias TwitterDevMood.Statistic
  alias TwitterDevMood.Repo

  def backup(languages) when is_list(languages) do
    languages
    |> Enum.each(fn language ->
      spawn(fn -> backup(language) end)
    end)
  end

  def backup(%Language{} = language) do
    language
    |> generate_statistic()
    |> Repo.insert!
  end

  defp generate_statistic(language) do
    %Statistic{
      language: language,
      mood_avg: language.mood_avg,
    }
  end
end
