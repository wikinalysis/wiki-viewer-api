defmodule ViewerApiWeb.Router do
  use ViewerApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ViewerApiWeb do
    pipe_through :api

    resources "/revisions", RevisionController, except: [:new, :edit, :create, :update, :delete]
  end
end
