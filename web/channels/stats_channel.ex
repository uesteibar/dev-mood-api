defmodule TwitterDevMood.StatsChannel do
  use TwitterDevMood.Web, :channel

  def join("stats:languages", _payload, socket) do
    send(self(), :after_join)

    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    TwitterDevMood.Notifier.StatsUpdated.notify_languages()

    {:noreply, socket}
  end
end
