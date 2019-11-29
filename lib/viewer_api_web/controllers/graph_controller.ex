defmodule ViewerApiWeb.GraphController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Graph

  action_fallback ViewerApiWeb.FallbackController

  @revision_fields [:created_at, :text_length]
  @page_fields [:revision_count]

  def page_select(conn, %{"language" => language, "field" => field}) do
    case String.to_atom(ProperCase.snake_case(field)) do
      f when f in @page_fields ->
        data = Graph.page_select(language, f)
        render(conn, "page_select.json", data: data)

      _ ->
        error(conn)
    end
  end

  def page_select(conn, _params) do
    error(conn)
  end

  def revision_select(conn, %{"language" => language, "field" => field}) do
    case String.to_atom(ProperCase.snake_case(field)) do
      f when f in @revision_fields ->
        data = Graph.revision_select(language, f)
        render(conn, "revision_select.json", data: data)

      _ ->
        error(conn)
    end
  end

  def revision_select(conn, _params) do
    error(conn)
  end

  defp error(conn) do
    conn
    |> put_status(:not_found)
    |> put_view(ViewerApiWeb.ErrorView)
    |> render(:"404")
  end
end
