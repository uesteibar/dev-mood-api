defmodule TwitterDevMood do
  use Application

  alias TwitterDevMood.Repo
  alias TwitterDevMood.Keyword

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(TwitterDevMood.Repo, []),
      # Start the endpoint when the application starts
      supervisor(TwitterDevMood.Endpoint, []),
      # Start your own worker by calling: TwitterDevMood.Worker.start_link(arg1, arg2, arg3)
      # worker(TwitterDevMood.Worker, [arg1, arg2, arg3]),
      worker(TwitterDevMood.TwitterStream.Listener.Server, []),
      worker(TwitterDevMood.TwitterStream.Processor.Server, []),
      worker(TwitterDevMood.Statistics.Server, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TwitterDevMood.Supervisor]
    process = Supervisor.start_link(children, opts)

    keywords = Repo.all(Keyword)
    TwitterDevMood.TwitterStream.Listener.Server.listen(keywords)

    TwitterDevMood.Statistics.Scheduler.schedule_backups("0 23 * * *")

    process
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TwitterDevMood.Endpoint.config_change(changed, removed)
    :ok
  end
end
