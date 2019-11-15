defmodule ViewerApiWeb.LanguageView do
  use ViewerApiWeb, :view
  alias ViewerApiWeb.LanguageView

  def render("index.json", %{languages: languages}) do
    %{data: render_many(languages, LanguageView, "language.json")}
  end

  def render("language.json", %{language: language}) do
    %{
      code: language.code,
      name: language.name
    }
  end
end
