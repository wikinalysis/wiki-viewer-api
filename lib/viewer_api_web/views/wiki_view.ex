defmodule ViewerApiWeb.WikiView do
  use ViewerApiWeb, :view
  alias ViewerApiWeb.WikiView

  def render("index.json", %{wikis: wikis}) do
    %{data: render_many(wikis, WikiView, "wiki.json")}
  end

  def render("wiki.json", %{wiki: wiki}) do
    %{
      id: wiki.id,
      language: wiki.language_name,
      language_local: wiki.language_local,
      article_count: wiki.article_count,
      page_count: wiki.page_count,
      edit_count: wiki.edit_count,
      admin_count: wiki.admin_count,
      user_count: wiki.user_count,
      active_user_count: wiki.active_user_count,
      image_count: wiki.image_count
    }
  end
end
