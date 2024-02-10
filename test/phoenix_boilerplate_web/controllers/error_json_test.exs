defmodule PhoenixBoilerplateWeb.ErrorJSONTest do
  use PhoenixBoilerplateWeb.ConnCase, async: true

  test "renders 404" do
    assert PhoenixBoilerplateWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PhoenixBoilerplateWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
