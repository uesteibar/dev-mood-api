defmodule TwitterDevMood.TwitterStream.Processor.Server do
  use GenServer

  alias TwitterDevMood.Repo
  alias TwitterDevMood.Language

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: :tweet_processor_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:process, tweet}, _) do
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

    {:noreply, %{}}
  end

  def process(tweet) do
    GenServer.cast(:tweet_processor_server, {:process, tweet})
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
