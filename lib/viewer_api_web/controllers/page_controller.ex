defmodule ViewerApiWeb.PageController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Wiki
  alias ViewerApi.Wiki.Page

  action_fallback ViewerApiWeb.FallbackController

  def index(conn, %{"language" => language}) do
    pages = Wiki.list_pages(language)
    render(conn, "index.json", pages: pages)
  end

  def show(conn, %{"id" => id}) do
    with %Wiki.Page{} = page <- Wiki.get_page(id) do
      render(conn, "show.json", page: page)
    end
  end
end
