defmodule CareCostManager.Router do
  use CareCostManager.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CareCostManager do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/residents", ResidentController
    resources "/locations", LocationController
    resources "/products", ProductController
    resources "/budgets", BudgetController
    resources "/stocks", StockController
    resources "/planned_usages", PlannedUsageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CareCostManager do
  #   pipe_through :api
  # end
end
