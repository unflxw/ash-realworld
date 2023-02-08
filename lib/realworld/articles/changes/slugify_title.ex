defmodule Realworld.Articles.Changes.SlugifyTitle do
  use Ash.Resource.Change
  alias Ash.Changeset

  @impl true
  @spec change(Changeset.t(), keyword, Change.context()) :: Changeset.t()
  def change(changeset, _options, _context) do
    case Changeset.get_attribute(changeset, :title) do
      title when is_binary(title) ->
        Changeset.change_attribute(changeset, :slug, Slug.slugify(title))

      _ ->
        changeset
    end
  end
end
