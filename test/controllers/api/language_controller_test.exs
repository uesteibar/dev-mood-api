defmodule TwitterDevMood.Api.LanguageControllerTest do
  use TwitterDevMood.ConnCase

  alias TwitterDevMood.Language
  alias TwitterDevMood.Keyword

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "#index" do
    test "lists all entries on index", %{conn: conn} do
      language = Repo.insert! %Language{
        name: "name",
        type: "type",
        mood: 10,
        occurrences: 2,
        keywords: [
          %Keyword{keyword: "#name"},
          %Keyword{keyword: "@name"},
        ]
      }

      conn = get conn, api_language_path(conn, :index)
      assert json_response(conn, 200)["collection"] == [
        %{
          "id" => language.id,
          "name" => language.name,
          "type" => language.type,
          "moodAvg" => 5.0,
          "history" => [],
          "occurrences" => language.occurrences,
          "keywords" => ["#name", "@name"]
        }
      ]
    end
  end
end
