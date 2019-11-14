defmodule ViewerApi.Wiki.Page do
  use Ecto.Schema
  import Ecto.Changeset
  alias ViewerApi.Wiki.Revision

  @primary_key {:id, :string, []}
  @derive {Phoenix.Param, key: :id}
  schema "pages" do
    field :language, :string, source: :wiki_language
    field :revision_count, :integer
    field :title, :string
    field :wiki_id, :integer
    belongs_to :latest, Revision, type: :string, foreign_key: :latest_id
    belongs_to :first, Revision, type: :string, foreign_key: :first_id
    has_many :revisions, Revision, foreign_key: :page_id
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:wiki_id, :language, :title, :revision_count, :latest_id, :first_id])
    |> validate_required([:wiki_id, :language, :title, :revision_count, :latest_id, :first_id])
  end
end
