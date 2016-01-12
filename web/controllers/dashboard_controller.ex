defmodule CareCostManager.DashboardController do
  use CareCostManager.Web, :controller

  alias CareCostManager.Dashboard

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
