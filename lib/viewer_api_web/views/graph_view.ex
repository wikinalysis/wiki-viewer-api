defmodule ViewerApiWeb.GraphView do
  use ViewerApiWeb, :view
  alias ViewerApiWeb.GraphView

  def render("revision_count_latest_length.json", %{data: data, meta: meta}) do
    %{
      meta: %{max_revision_count: elem(meta, 0), max_latest_length: elem(meta, 1)},
      data: render_many(data, GraphView, "revision_count_latest_length_data.json")
    }
  end

  def render("revision_count_latest_length_data.json", %{graph: data}) do
    %{
      page_id: elem(data, 0),
      revision_id: elem(data, 1),
      revision_count: elem(data, 2),
      latest_length: elem(data, 3)
    }
  end
end
