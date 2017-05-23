defmodule TwitterDevMood.Statistics.Scheduler do
  def schedule_backups(schedule) do
    Quantum.add_job(schedule, fn ->
      IO.puts "bakup!"
      TwitterDevMood.Statistics.Server.backup_stats()
    end)
  end
end
