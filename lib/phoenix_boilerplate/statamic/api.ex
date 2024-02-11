defmodule PhoenixBoilerplate.Statamic.API do
  def api_host() do
    System.get_env("STATAMIC_URL") || ""
  end

  def api_route() do
    System.get_env("STATAMIC_API_ROUTE") || "/api"
  end

  def get(path) do
    %Req.Response{body: body} = Req.get!(url(path))
    body["data"]
  end

  defp url(path) do
    path = join_path(api_route(), path)

    api_host()
    |> URI.parse()
    |> URI.merge(path)
    |> URI.to_string()
  end

  defp join_path(path1, path2) do
    seg1 = String.split(path1, "/")
    seg2 = String.split(path2, "/")

    [seg1 | seg2]
    |> Enum.reject(&(&1 == ""))
    |> Enum.join("/")
  end
end
