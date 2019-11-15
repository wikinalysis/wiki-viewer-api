defmodule ViewerApiWeb.Router do
  use ViewerApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ViewerApiWeb do
    pipe_through :api
    resources "/languages", LanguageController, only: [:index]
  end

  scope "/api/:language", ViewerApiWeb do
    pipe_through :api

    resources "/revisions", RevisionController, only: [:index, :show]
    resources "/pages", PageController, only: [:index, :show]
  end
end
