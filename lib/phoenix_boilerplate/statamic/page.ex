defmodule PhoenixBoilerplate.Statamic.Page do
  alias PhoenixBoilerplate.Statamic.API

  def get(segments) do
    tree = get_tree()

    case find_page(tree, segments) do
      nil ->
        raise Ecto.NoResultsError, queryable: "Statamic Page"

      page ->
        page
    end
  end

  defp get_tree() do
    API.get("/collections/pages/tree")
  end

  defp find_page(_tree, []), do: nil
  defp find_page(tree, [seg]), do: find_in_tree(tree, seg)

  defp find_page(tree, [seg | segments]) do
    case find_in_tree(tree, seg) do
      nil -> nil
      entry -> find_page(entry["children"], segments)
    end
  end

  defp find_in_tree(tree, seg) do
    Enum.find(tree, fn entry -> entry["page"]["slug"] == seg end)
  end
end
