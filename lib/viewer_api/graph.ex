defmodule ViewerApi.Graph do
  @moduledoc """
  The Graph context.
  """

  import Ecto.Query, warn: false
  alias ViewerApi.Repo
  alias ViewerApi.Wiki.{Revision, Page}

  def revision_select(language, field) do
    fields = [:id, :language, field]

    query =
      from r in Revision,
        where: r.language == ^language,
        where: r.is_latest == true,
        select: map(r, ^fields)

    Repo.all(query)
  end

  def page_select(language, field) do
    fields = [:id, :language, field]

    query =
      from p in Page,
        where: p.language == ^language,
        select: map(p, ^fields)

    Repo.all(query)
  end
end
