defmodule ViewerApiWeb.LanguageController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Wiki
  alias ViewerApi.Wiki.Page

  action_fallback ViewerApiWeb.FallbackController

  def index(conn, _params) do
    languages = Wiki.list_languages()
    render(conn, "index.json", languages: languages)
  end
end
