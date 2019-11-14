defmodule ViewerApiWeb.RevisionController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Wiki

  action_fallback ViewerApiWeb.FallbackController

  def index(conn, _params) do
    revisions = Wiki.list_revisions()
    render(conn, "index.json", revisions: revisions)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, revision} <- Wiki.get_revision(id) do
      render(conn, "show.json", revision: revision)
    end
  end
end
