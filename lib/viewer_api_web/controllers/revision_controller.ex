defmodule ViewerApiWeb.RevisionController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Wiki

  action_fallback ViewerApiWeb.FallbackController

  def index(conn, %{"language" => language}) do
    revisions = Wiki.list_revisions(language)
    render(conn, "index.json", revisions: revisions)
  end

  def show(conn, %{"id" => id}) do
    with %Wiki.Revision{} = revision <- Wiki.get_revision(id) do
      render(conn, "show.json", revision: revision)
    end
  end
end
