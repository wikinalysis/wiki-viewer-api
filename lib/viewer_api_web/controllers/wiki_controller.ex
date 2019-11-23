defmodule ViewerApiWeb.WikiController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Wiki

  action_fallback ViewerApiWeb.FallbackController

  def index(conn, _params) do
    wikis = Wiki.list_wikis()
    render(conn, "index.json", wikis: wikis)
  end
end
