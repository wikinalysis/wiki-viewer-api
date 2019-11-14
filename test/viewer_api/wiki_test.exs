defmodule ViewerApi.WikiTest do
  use ViewerApi.DataCase

  alias ViewerApi.Wiki

  describe "revisions" do
    alias ViewerApi.Wiki.Revision

    @valid_attrs %{
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

    def revision_fixture(attrs \\ %{}) do
      {:ok, revision} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Wiki.create_revision()

      revision
    end

    test "list_revisions/0 returns all revisions" do
      revision = revision_fixture()
      assert Wiki.list_revisions() == [revision]
    end

    test "get_revision!/1 returns the revision with given id" do
      revision = revision_fixture()
      assert Wiki.get_revision!(revision.id) == revision
    end

    test "create_revision/1 with valid data creates a revision" do
      assert {:ok, %Revision{} = revision} = Wiki.create_revision(@valid_attrs)
      assert revision.created_at == "some created_at"
      assert revision.has_text == true
      assert revision.language == "some language"
      assert revision.page_id == 42
      assert revision.sha1 == "some sha1"
      assert revision.text_length == 42
      assert revision.wiki_id == 42
    end

    test "create_revision/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wiki.create_revision(@invalid_attrs)
    end

    test "change_revision/1 returns a revision changeset" do
      revision = revision_fixture()
      assert %Ecto.Changeset{} = Wiki.change_revision(revision)
    end
  end

  describe "pages" do
    alias ViewerApi.Wiki.Page

    @valid_attrs %{
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

    def page_fixture(attrs \\ %{}) do
      {:ok, page} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Wiki.create_page()

      page
    end

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Wiki.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Wiki.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      assert {:ok, %Page{} = page} = Wiki.create_page(@valid_attrs)
      assert page.first_id == 42
      assert page.language == "some language"
      assert page.latest_id == 42
      assert page.revision_count == 42
      assert page.title == "some title"
      assert page.wiki_id == 42
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wiki.create_page(@invalid_attrs)
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Wiki.change_page(page)
    end
  end
end
