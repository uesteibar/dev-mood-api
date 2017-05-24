defmodule TwitterDevMood.Router do
  use TwitterDevMood.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TwitterDevMood do
    pipe_through :browser # Use the default browser stack

    get "/", LanguageController, :index
    get "/chart", LanguageController, :chart
  end

  # Other scopes may use custom stacks.
  scope "/api", TwitterDevMood, as: "api" do
    pipe_through :api

    resources "/languages", Api.LanguageController, only: [:index]
    resources "/tags", Api.TagController, only: [:index]
  end
end
