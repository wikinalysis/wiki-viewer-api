defmodule ViewerApi.Wiki.Revision do
  use Ecto.Schema
  import Ecto.Changeset
  alias ViewerApi.Wiki.Page

  @primary_key {:id, :string, []}
  @derive {Phoenix.Param, key: :id}
  schema "revisions" do
    field :created_at, :string
    field :has_text, :boolean, default: false
    field :language, :string, source: :wiki_language
    field :is_first, :boolean, default: false
    field :is_latest, :boolean, default: false
    field :revision_number, :integer
    field :sha1, :string
    field :text_length, :integer
    field :wiki_id, :integer
    belongs_to :page, Page, type: :string, foreign_key: :page_id
  end

  @doc false
  def changeset(revision, attrs) do
    revision
    |> cast(attrs, [:wiki_id, :page_id, :language, :text_length, :has_text, :sha1, :created_at])
    |> validate_required([
      :wiki_id,
      :page_id,
      :language,
      :text_length,
      :has_text,
      :sha1,
      :created_at
    ])
  end
end
