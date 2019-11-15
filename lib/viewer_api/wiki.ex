defmodule ViewerApi.Wiki do
  @moduledoc """
  The Wiki context.
  """

  import Ecto.Query, warn: false
  alias ViewerApi.Repo

  alias ViewerApi.Wiki.Revision

  @doc """
  Returns the list of languages.

  ## Examples

      iex> list_languages()
      [%Language{}, ...]

  """
  def list_languages do
    [
      %Language{code: "simple", name: "Simple English"},
      %Language{code: "tn", name: "Setswana"},
      %Language{code: "sco", name: "Scottish"},
      %Language{code: "ga", name: "Irish"}
    ]
  end

  @doc """
  Returns the list of revisions.

  ## Examples

      iex> list_revisions(language)
      [%Revision{}, ...]

  """
  def list_revisions(language) do
    Revision
    |> where([r], r.language == ^language)
    |> Repo.all()
  end

  @doc """
  Gets a single revision.

  Raises `Ecto.NoResultsError` if the Revision does not exist.

  ## Examples

      iex> get_revision!(123)
      %Revision{}

      iex> get_revision!(456)
      ** (Ecto.NoResultsError)

  """
  def get_revision(id) do
    Revision
    |> preload(:page)
    |> Repo.get(id)
  end

  @doc """
  Creates a revision.

  ## Examples

      iex> create_revision(%{field: value})
      {:ok, %Revision{}}

      iex> create_revision(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_revision(attrs \\ %{}) do
    %Revision{}
    |> Revision.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking revision changes.

  ## Examples

      iex> change_revision(revision)
      %Ecto.Changeset{source: %Revision{}}

  """
  def change_revision(%Revision{} = revision) do
    Revision.changeset(revision, %{})
  end

  alias ViewerApi.Wiki.Page

  @doc """
  Returns the list of pages.

  ## Examples

      iex> list_pages(language)
      [%Page{}, ...]

  """
  def list_pages(language) do
    Page
    |> where([r], r.language == ^language)
    |> Repo.all()
  end

  @doc """
  Gets a single page.

  Raises `Ecto.NoResultsError` if the Page does not exist.

  ## Examples

      iex> get_page!(123)
      %Page{}

      iex> get_page!(456)
      ** (Ecto.NoResultsError)

  """
  def get_page(id) do
    Page
    |> preload(:first)
    |> preload(:latest)
    |> preload(:revisions)
    |> Repo.get(id)
  end

  @doc """
  Creates a page.

  ## Examples

      iex> create_page(%{field: value})
      {:ok, %Page{}}

      iex> create_page(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_page(attrs \\ %{}) do
    %Page{}
    |> Page.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking page changes.

  ## Examples

      iex> change_page(page)
      %Ecto.Changeset{source: %Page{}}

  """
  def change_page(%Page{} = page) do
    Page.changeset(page, %{})
  end
end
