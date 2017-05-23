defmodule TwitterDevMood.TwitterStream.Listener do
  def listen(keywords, f) do
    spawn(fn ->
      IO.puts "Listening to #{keywords}"
      listen_to(keywords, f)
    end)
  end

  def listen_to(keywords, f) do
    ExTwitter.configure(:process, [
      consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
      consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET"),
      access_token: System.get_env("TWITTER_ACCESS_TOKEN"),
      access_token_secret: System.get_env("TWITTER_ACCESS_SECRET"),
    ])

    stream = ExTwitter.stream_filter([track: keywords, language: "en"], :infinity)
    for tweet <- stream, do: f.(tweet)
  end
end
