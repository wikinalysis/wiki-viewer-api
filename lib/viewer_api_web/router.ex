defmodule ViewerApiWeb.Router do
  use ViewerApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "http://localhost:3000"
    plug :accepts, ["json"]
  end

  scope "/api", ViewerApiWeb do
    pipe_through :api
    resources "/wikis", WikiController, only: [:index]
    resources "/revisions", RevisionController, only: [:index, :show]
    resources "/pages", PageController, only: [:index, :show]
    get "/revision-count-latest-length", GraphController, :revision_count_latest_length
  end
end
