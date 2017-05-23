defmodule TwitterDevMood.Statistics.Server do
  use GenServer

  alias TwitterDevMood.Statistics.Backup
  alias TwitterDevMood.Language
  alias TwitterDevMood.Repo

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: :statistics_backup_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:backup_stats, languages}, _) do
    Backup.backup(languages)

    {:noreply, %{}}
  end

  def backup_stats() do
    languages = Language |> Language.calculate_mood_avg |> Repo.all()

    GenServer.cast(:statistics_backup_server, {:backup_stats, languages})
  end
end
