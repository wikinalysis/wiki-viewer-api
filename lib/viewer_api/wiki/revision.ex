defmodule ViewerApi.Wiki.Revision do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:wiki_id, :integer, []}
  @derive {Phoenix.Param, key: :wiki_id}
  schema "revisions" do
    field :created_at, :string
    field :has_text, :boolean, default: false
    field :language, :string, source: :wiki_language
    field :page_id, :integer
    field :sha1, :string
    field :text_length, :integer
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
