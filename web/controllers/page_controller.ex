defmodule CareCostManager.PageController do
  use CareCostManager.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
