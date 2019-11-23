defmodule ViewerApi.Wiki.Wiki do
  use Ecto.Schema
  import Ecto.Changeset
  alias ViewerApi.Wiki.Page

  @primary_key {:id, :string, []}
  @derive {Phoenix.Param, key: :id}
  schema "wikis" do
    field :language_name, :string
    field :language_local, :string
    field :article_count, :integer
    field :admin_count, :integer
    field :user_count, :integer
    field :active_user_count, :integer
    field :page_count, :integer
    field :edit_count, :integer
    field :image_count, :integer
  end

  # @doc false
  # def changeset(revision, attrs) do
  #   revision
  #   |> cast(attrs, [:wiki_id, :page_id, :language, :text_length, :has_text, :sha1, :created_at])
  #   |> validate_required([
  #     :wiki_id,
  #     :page_id,
  #     :language,
  #     :text_length,
  #     :has_text,
  #     :sha1,
  #     :created_at
  #   ])
  # end
end
