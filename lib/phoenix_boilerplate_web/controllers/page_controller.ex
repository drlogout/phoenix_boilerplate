defmodule PhoenixBoilerplateWeb.PageController do
  use PhoenixBoilerplateWeb, :controller

  alias PhoenixBoilerplate.Statamic.Page

  def home(conn, %{"segments" => segments} = _params) do
    Page.get(segments)
    # page =
    #   case Page.get(segments) do
    #     nil ->
    #       raise %Ecto.NoResultsError{}

    #     page ->
    #       page
    #   end

    # {:error, :mudder}
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
