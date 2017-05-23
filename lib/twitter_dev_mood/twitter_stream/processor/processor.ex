defmodule TwitterDevMood.TwitterStream.Processor do
  alias TwitterDevMood.Repo
  alias TwitterDevMood.Language

  def process(tweet) do
    mentions = Enum.map(tweet.entities.user_mentions, &("@#{&1.screen_name}"))
    hashtags = Enum.map(tweet.entities.hashtags, &("##{&1.text}"))

    keywords = Enum.concat([mentions, hashtags])
                |> Enum.map(&String.downcase/1)
                |> Enum.uniq

    Language
    |> Language.has_keywords(keywords)
    |> Repo.all
    |> Enum.map(&(update_language(&1, tweet)))

    TwitterDevMood.Notifier.StatsUpdated.notify_languages()
  end

  defp update_language(language, tweet) do
    Language.changeset(
      language,
      %{
        mood: language.mood + (Veritaserum.analyze(tweet.text) * 10),
        occurrences: language.occurrences + 1
      }
    )
    |> Repo.update
  end
end
