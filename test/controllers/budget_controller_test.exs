defmodule CareCostManager.BudgetControllerTest do
  use CareCostManager.ConnCase

  alias CareCostManager.Budget
  @valid_attrs %{annual_dollars: "120.5", location: "some content", month: 42, year: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, budget_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing budgets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, budget_path(conn, :new)
    assert html_response(conn, 200) =~ "New budget"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, budget_path(conn, :create), budget: @valid_attrs
    assert redirected_to(conn) == budget_path(conn, :index)
    assert Repo.get_by(Budget, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, budget_path(conn, :create), budget: @invalid_attrs
    assert html_response(conn, 200) =~ "New budget"
  end

  test "shows chosen resource", %{conn: conn} do
    budget = Repo.insert! %Budget{}
    conn = get conn, budget_path(conn, :show, budget)
    assert html_response(conn, 200) =~ "Show budget"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, budget_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    budget = Repo.insert! %Budget{}
    conn = get conn, budget_path(conn, :edit, budget)
    assert html_response(conn, 200) =~ "Edit budget"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    budget = Repo.insert! %Budget{}
    conn = put conn, budget_path(conn, :update, budget), budget: @valid_attrs
    assert redirected_to(conn) == budget_path(conn, :show, budget)
    assert Repo.get_by(Budget, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    budget = Repo.insert! %Budget{}
    conn = put conn, budget_path(conn, :update, budget), budget: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit budget"
  end

  test "deletes chosen resource", %{conn: conn} do
    budget = Repo.insert! %Budget{}
    conn = delete conn, budget_path(conn, :delete, budget)
    assert redirected_to(conn) == budget_path(conn, :index)
    refute Repo.get(Budget, budget.id)
  end
end
