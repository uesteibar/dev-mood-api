defmodule TwitterDevMood.Api.TagController do
  use TwitterDevMood.Web, :controller

  alias TwitterDevMood.Tag

  def index(conn, _params) do
    tags = Repo.all(Tag)

    render(conn, "index.json", tags: tags)
  end
end
