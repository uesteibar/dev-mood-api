# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TwitterDevMood.Repo.insert!(%TwitterDevMood.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TwitterDevMood.Repo
alias TwitterDevMood.Language
alias TwitterDevMood.Keyword
alias TwitterDevMood.Tag



languages = [
  %Language{
    name: "Javascript",
    keywords: [
      %Keyword{keyword: "#javascript"},
      %Keyword{keyword: "#js"},
    ],
    type: "language",
  },
  %Language{
    name: "Ruby",
    keywords: [
      %Keyword{keyword: "#ruby"},
    ],
    type: "language"
  },
  %Language{
    name: "Ruby on Rails",
    keywords:  [
      %Keyword{keyword: "#rubyonrails"},
      %Keyword{keyword: "#rails"},
      %Keyword{keyword: "@rails"},
    ],
    type: "framework"
  },
  %Language{
    name: "Elixir",
    keywords: [
      %Keyword{keyword: "#elixirlang"},
      %Keyword{keyword: "@elixirlang"},
      %Keyword{keyword: "#myelixirstatus"},
    ],
    type: "language"
  },
  %Language{
    name: "PHP",
    keywords: [
      %Keyword{keyword: "#php"},
    ],
    type: "language"
  },
  %Language{
    name: "Symfony",
    keywords: [
      %Keyword{keyword: "#symfony"},
      %Keyword{keyword: "@symfony"},
    ],
    type: "framework"
  },
  %Language{
    name: "Laravel",
    keywords: [
      %Keyword{keyword: "#laravel"},
      %Keyword{keyword: "@laravelphp"},
    ],
    type: "framework"
  },
  %Language{
    name: "Python",
    keywords: [
      %Keyword{keyword: "#python"},
    ],
    type: "language"
  },
  %Language{
    name: "Java",
    keywords: [
      %Keyword{keyword: "#java"},
      %Keyword{keyword: "@java"},
    ],
    type: "language"
  },
  %Language{
    name: "Go",
    keywords: [
      %Keyword{keyword: "#golang"},
      %Keyword{keyword: "@golang"},
    ],
    type: "language"
  },
  %Language{
    name: "Scala",
    keywords: [
      %Keyword{keyword: "#scala"},
      %Keyword{keyword: "@scala_lang"},
    ],
    type: "language"
  },
  %Language{
    name: "React.js",
    keywords: [
      %Keyword{keyword: "#reactjs"},
      %Keyword{keyword: "@reactjs"},
    ],
    type: "framework"
  },
  %Language{
    name: "Vue.js",
    keywords: [
      %Keyword{keyword: "#vuejs"},
      %Keyword{keyword: "@vuejs"},
    ],
    type: "framework"
  },
  %Language{
    name: "Angular.js",
    keywords: [
      %Keyword{keyword: "#angularjs"},
      %Keyword{keyword: "@angular"},
    ],
    type: "framework"
  },
  %Language{
    name: "Phoenix",
    keywords: [
      %Keyword{keyword: "#elixirphoenix"},
      %Keyword{keyword: "@elixirphoenix"},
    ],
    type: "framework"
  },
  %Language{
    name: "C#",
    keywords: [
      %Keyword{keyword: "#csharp"},
    ],
    type: "language"
  },
  %Language{
    name: "F#",
    keywords: [
      %Keyword{keyword: "#fsharp"},
    ],
    type: "language"
  },
  %Language{
    name: "Android (Java)",
    keywords: [
      %Keyword{keyword: "#androiddev"},
    ],
    type: "language"
  },
  %Language{
    name: "kotlin",
    keywords: [
      %Keyword{keyword: "#kotlin"},
      %Keyword{keyword: "@kotlin"},
    ],
    type: "language"
  },
  %Language{
    name: "Objective C",
    keywords: [
      %Keyword{keyword: "#objectivec"},
      %Keyword{keyword: "@objectivec"},
    ],
    type: "language"
  },
  %Language{
    name: "Swift",
    keywords: [
      %Keyword{keyword: "#swift"},
    ],
    type: "language"
  },
  %Language{
    name: "Ionic framework",
    keywords: [
      %Keyword{keyword: "#ionic"},
      %Keyword{keyword: "@ionicframework"},
    ],
    type: "framework"
  },
  %Language{
    name: "React Native",
    keywords: [
      %Keyword{keyword: "#reactnative"},
      %Keyword{keyword: "@reactnative"},
    ],
    type: "framework"
  },
]

Enum.map(languages, &Repo.insert/1)

tags = [
  %Tag{tag: "javascript"},
  %Tag{tag: "php"},
  %Tag{tag: "ruby"},
  %Tag{tag: "elixir"},
  %Tag{tag: "python"},
  %Tag{tag: "golang"},
  %Tag{tag: ".net"},
  %Tag{tag: "jvm"},
  %Tag{tag: "functional"},
  %Tag{tag: "object_oriented"},
  %Tag{tag: "compiled"},
  %Tag{tag: "interpreted"},
  %Tag{tag: "mobile"},
  %Tag{tag: "android"},
  %Tag{tag: "ios"},
  %Tag{tag: "frontend"},
  %Tag{tag: "backend"},
  %Tag{tag: "web"},
  %Tag{tag: "scripting"},
]

Enum.map(tags, &Repo.insert/1)

tags_for_languages = %{
  "#javascript" => ["javascript", "frontend", "web", "interpreted"],
  "#reactjs" => ["javascript", "frontend", "web"],
  "#vuejs" => ["javascript", "frontend", "web"],
  "#angularjs" => ["javascript", "frontend", "web"],
  "#ruby" => ["ruby", "backend", "web", "scripting", "object_oriented", "interpreted"],
  "#rubyonrails" => ["ruby", "backend", "web"],
  "#elixirlang" => ["elixir", "backend", "web", "functional", "compiled"],
  "#elixirphoenix" => ["elixir", "backend", "web"],
  "#php" => ["php", "backend", "scripting", "web", "object_oriented", "interpreted"],
  "#symfony" => ["php", "backend", "web"],
  "#laravel" => ["php", "backend", "web"],
  "#python" => ["python", "scripting", "backend", "web", "object_oriented", "interpreted"],
  "#java" => ["jvm", "mobile", "android", "backend", "web", "object_oriented", "compiled"],
  "#scala" => ["jvm", "backend", "web", "functional", "compiled"],
  "#golang" => ["golang", "backend", "scripting", "web", "compiled"],
  "#csharp" => [".net", "backend", "web", "object_oriented", "compiled"],
  "#fsharp" => [".net", "backend", "web", "functional", "compiled"],
  "#androiddev" => ["mobile", "android", "object_oriented", "compiled"],
  "#kotlin" => ["jvm", "mobile", "android", "compiled"],
  "#objectivec" => ["ios", "mobile", "compiled"],
  "#swift" => ["ios", "mobile", "compiled"],
  "#ionic" => ["javascript", "mobile", "android", "ios"],
  "#reactnative" => ["javascript", "mobile", "android", "ios"],
}

Enum.each(tags_for_languages, fn {keyword, _} ->
  language = Language
              |> Language.has_keywords([keyword])
              |> Language.preload_tags
              |> Repo.one

  tags = tags_for_languages[keyword] |> Enum.map(&Tag.find_by_tag/1)

  language
  |> Ecto.Changeset.change
  |> Ecto.Changeset.put_assoc(:tags, tags)
  |> Repo.update
end)
