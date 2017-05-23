defmodule TwitterDevMood.TwitterStream.Processor.Server do
  use GenServer

  alias TwitterDevMood.TwitterStream.Processor

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: :tweet_processor_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:process, tweet}, _) do
    Processor.process(tweet)

    {:noreply, %{}}
  end

  def process(tweet) do
    GenServer.cast(:tweet_processor_server, {:process, tweet})
  end
end
