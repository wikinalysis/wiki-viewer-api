defmodule ViewerApiWeb.GraphController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Graph

  action_fallback ViewerApiWeb.FallbackController

  def revision_count_latest_length(conn, %{"language" => language}) do
    data = Graph.revision_count_vs_latest_length(language)
    meta = Graph.revision_count_vs_latest_length_meta(language)
    IO.puts(inspect(meta))
    render(conn, "revision_count_latest_length.json", data: data, meta: meta)
  end
end
