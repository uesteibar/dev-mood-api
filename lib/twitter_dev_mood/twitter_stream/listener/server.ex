defmodule TwitterDevMood.TwitterStream.Listener.Server do
  use GenServer

  alias TwitterDevMood.TwitterStream.Processor
  alias TwitterDevMood.TwitterStream.Listener

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: :twitter_stream_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:listen, keywords}, _) do
    Listener.listen(keywords, &Processor.Server.process/1)

    {:noreply, %{}}
  end

  def listen(keywords) do
    keywords = keywords
                |> Enum.map(&(&1.keyword))
                |> Enum.join(",")

    GenServer.cast(:twitter_stream_server, {:listen, keywords})
  end
end
