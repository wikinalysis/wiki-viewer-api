defmodule ViewerApi.WikiTest do
  use ViewerApi.DataCase

  alias ViewerApi.Wiki

  describe "revisions" do
    alias ViewerApi.Wiki.Revision

    @valid_attrs %{created_at: "some created_at", has_text: true, language: "some language", page_id: 42, sha1: "some sha1", text_length: 42, wiki_id: 42}
    @update_attrs %{created_at: "some updated created_at", has_text: false, language: "some updated language", page_id: 43, sha1: "some updated sha1", text_length: 43, wiki_id: 43}
    @invalid_attrs %{created_at: nil, has_text: nil, language: nil, page_id: nil, sha1: nil, text_length: nil, wiki_id: nil}

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
end
