defmodule ViewerApiWeb.RevisionController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Wiki
  alias ViewerApi.Wiki.Revision

  action_fallback ViewerApiWeb.FallbackController

  def index(conn, _params) do
    revisions = Wiki.list_revisions()
    render(conn, "index.json", revisions: revisions)
  end

  def show(conn, %{"id" => id}) do
    revision = Wiki.get_revision!(id)
    render(conn, "show.json", revision: revision)
  end
end
