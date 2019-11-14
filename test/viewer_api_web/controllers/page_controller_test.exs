defmodule ViewerApiWeb.PageControllerTest do
  use ViewerApiWeb.ConnCase

  alias ViewerApi.Wiki
  alias ViewerApi.Wiki.Page

  @create_attrs %{
    first_id: 42,
    language: "some language",
    latest_id: 42,
    revision_count: 42,
    title: "some title",
    wiki_id: 42
  }
  @update_attrs %{
    first_id: 43,
    language: "some updated language",
    latest_id: 43,
    revision_count: 43,
    title: "some updated title",
    wiki_id: 43
  }
  @invalid_attrs %{
    first_id: nil,
    language: nil,
    latest_id: nil,
    revision_count: nil,
    title: nil,
    wiki_id: nil
  }

  def fixture(:page) do
    {:ok, page} = Wiki.create_page(@create_attrs)
    page
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pages", %{conn: conn} do
      conn = get(conn, Routes.page_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  defp create_page(_) do
    page = fixture(:page)
    {:ok, page: page}
  end
end
