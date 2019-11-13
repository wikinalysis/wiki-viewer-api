defmodule ViewerApiWeb.RevisionControllerTest do
  use ViewerApiWeb.ConnCase

  alias ViewerApi.Wiki
  alias ViewerApi.Wiki.Revision

  @create_attrs %{
    created_at: "some created_at",
    has_text: true,
    language: "some language",
    page_id: 42,
    sha1: "some sha1",
    text_length: 42,
    wiki_id: 42
  }
  @update_attrs %{
    created_at: "some updated created_at",
    has_text: false,
    language: "some updated language",
    page_id: 43,
    sha1: "some updated sha1",
    text_length: 43,
    wiki_id: 43
  }
  @invalid_attrs %{
    created_at: nil,
    has_text: nil,
    language: nil,
    page_id: nil,
    sha1: nil,
    text_length: nil,
    wiki_id: nil
  }

  def fixture(:revision) do
    {:ok, revision} = Wiki.create_revision(@create_attrs)
    revision
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all revisions", %{conn: conn} do
      conn = get(conn, Routes.revision_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  defp create_revision(_) do
    revision = fixture(:revision)
    {:ok, revision: revision}
  end
end
