defmodule ViewerApiWeb.Router do
  use ViewerApiWeb, :router

  pipeline :test do
    plug CORSPlug, origin: "*"
  end

  pipeline :api do
    if Mix.env() == :dev do
      plug CORSPlug, origin: "*"
    else
      plug CORSPlug, origin: "https://www.wikinalysis.com"
    end

    plug :accepts, ["json"]
  end

  scope "/", ViewerApiWeb do
    pipe_through(:test)
    get "/", TestController, :index
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
