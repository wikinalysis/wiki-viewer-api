defmodule ViewerApiWeb.GraphView do
  use ViewerApiWeb, :view
  alias ViewerApiWeb.GraphView

  def render("revision_select.json", %{data: data}) do
    %{
      meta: create_meta(data),
      data: render_many(data, GraphView, "map.json")
    }
  end

  def render("page_select.json", %{data: data}) do
    %{
      meta: create_meta(data),
      data: render_many(data, GraphView, "map.json")
    }
  end

  def render("map.json", %{graph: data}) do
    data
  end

  defp create_meta(data) do
    case List.first(data) do
      %{text_length: _field} ->
        {min, max} = Enum.min_max_by(data, fn d -> d.text_length end)

        %{
          max_text_length: max.text_length,
          min_text_length: min.text_length
        }

      %{created_at: _field} ->
        {min, max} = Enum.min_max_by(data, fn d -> d.created_at end)

        %{
          max_created_at: max.created_at,
          min_created_at: min.created_at
        }

      %{revision_count: _field} ->
        {min, max} = Enum.min_max_by(data, fn d -> d.revision_count end)

        %{
          max_revision_count: max.revision_count,
          min_revision_count: min.revision_count
        }
    end
  end
end
