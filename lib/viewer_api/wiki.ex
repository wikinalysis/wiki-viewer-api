defmodule ViewerApi.Wiki do
  @moduledoc """
  The Wiki context.
  """

  import Ecto.Query, warn: false
  alias ViewerApi.Repo

  alias ViewerApi.Wiki.Revision

  @doc """
  Returns the list of revisions.

  ## Examples

      iex> list_revisions()
      [%Revision{}, ...]

  """
  def list_revisions do
    Repo.all(Revision)
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
  def get_revision!(id), do: Repo.get!(Revision, id)

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

  # @doc """
  # Updates a revision.

  # ## Examples

  #     iex> update_revision(revision, %{field: new_value})
  #     {:ok, %Revision{}}

  #     iex> update_revision(revision, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_revision(%Revision{} = revision, attrs) do
  #   revision
  #   |> Revision.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a Revision.

  # ## Examples

  #     iex> delete_revision(revision)
  #     {:ok, %Revision{}}

  #     iex> delete_revision(revision)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_revision(%Revision{} = revision) do
  #   Repo.delete(revision)
  # end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking revision changes.

  ## Examples

      iex> change_revision(revision)
      %Ecto.Changeset{source: %Revision{}}

  """
  def change_revision(%Revision{} = revision) do
    Revision.changeset(revision, %{})
  end
end
