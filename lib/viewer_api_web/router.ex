defmodule ViewerApiWeb.Router do
  use ViewerApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "http://localhost:3000"
    plug :accepts, ["json"]
  end

  scope "/api", ViewerApiWeb do
    pipe_through :api
    resources "/wikis", WikiController, only: [:index]

    get "/revisions/select", GraphController, :revision_select
    get "/pages/select", GraphController, :page_select

    resources "/revisions", RevisionController, only: [:index, :show]
    resources "/pages", PageController, only: [:index, :show]
  end
end
