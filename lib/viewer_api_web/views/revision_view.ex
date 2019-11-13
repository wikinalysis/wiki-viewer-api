defmodule ViewerApiWeb.RevisionView do
  use ViewerApiWeb, :view
  alias ViewerApiWeb.RevisionView

  def render("index.json", %{revisions: revisions}) do
    %{data: render_many(revisions, RevisionView, "revision.json")}
  end

  def render("show.json", %{revision: revision}) do
    %{data: render_one(revision, RevisionView, "revision.json")}
  end

  def render("revision.json", %{revision: revision}) do
    %{
      wiki_id: revision.wiki_id,
      page_id: revision.page_id,
      language: revision.language,
      text_length: revision.text_length,
      has_text: revision.has_text,
      sha1: revision.sha1,
      created_at: revision.created_at
    }
  end
end
