defmodule ViewerApi.Graph do
  @moduledoc """
  The Graph context.
  """

  import Ecto.Query, warn: false
  alias ViewerApi.Repo
  alias ViewerApi.Wiki.{Revision, Page}

  def revision_count_vs_latest_length(language) do
    query =
      from p in Page,
        where: p.language == ^language,
        join: r in Revision,
        on: r.id == p.latest_id,
        select: {p.revision_count, r.text_length}

    Repo.all(query)
  end
end
