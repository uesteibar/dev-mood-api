defmodule TwitterDevMood.Api.TagView do
  use TwitterDevMood.Web, :view

  def render("index.json", %{tags: tags}) do
    %{
      collection: render_many(tags, TwitterDevMood.Api.TagView, "show.json"),
    }
  end

  def render("show.json", %{tag: tag}) do
    %{
      tag: tag.tag,
    }
  end
end
