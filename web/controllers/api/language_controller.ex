defmodule TwitterDevMood.Api.LanguageController do
  use TwitterDevMood.Web, :controller

  alias TwitterDevMood.Language

  def index(conn, params) do
    languages = Language
                |> filter_languages(params)
                |> Language.preload_keywords
                |> Language.calculate_mood_avg
                |> Repo.all
                |> Enum.sort(&(&1.mood_avg > &2.mood_avg))

    render(conn, "index.json", languages: languages)
  end

  def filter_languages(query, %{"tag" => tag}) do
    query |> Language.has_tag([tag])
  end
  def filter_languages(query, _params), do: query
end
