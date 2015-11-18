defmodule CareCostManager.PlannedUsageControllerTest do
  use CareCostManager.ConnCase

  alias CareCostManager.PlannedUsage
  @valid_attrs %{shift: "some content", size: "some content", transaction_date: "2010-04-17 14:00:00", usage: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, planned_usage_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing planned usages"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, planned_usage_path(conn, :new)
    assert html_response(conn, 200) =~ "New planned usage"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, planned_usage_path(conn, :create), planned_usage: @valid_attrs
    assert redirected_to(conn) == planned_usage_path(conn, :index)
    assert Repo.get_by(PlannedUsage, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, planned_usage_path(conn, :create), planned_usage: @invalid_attrs
    assert html_response(conn, 200) =~ "New planned usage"
  end

  test "shows chosen resource", %{conn: conn} do
    planned_usage = Repo.insert! %PlannedUsage{}
    conn = get conn, planned_usage_path(conn, :show, planned_usage)
    assert html_response(conn, 200) =~ "Show planned usage"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, planned_usage_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    planned_usage = Repo.insert! %PlannedUsage{}
    conn = get conn, planned_usage_path(conn, :edit, planned_usage)
    assert html_response(conn, 200) =~ "Edit planned usage"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    planned_usage = Repo.insert! %PlannedUsage{}
    conn = put conn, planned_usage_path(conn, :update, planned_usage), planned_usage: @valid_attrs
    assert redirected_to(conn) == planned_usage_path(conn, :show, planned_usage)
    assert Repo.get_by(PlannedUsage, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    planned_usage = Repo.insert! %PlannedUsage{}
    conn = put conn, planned_usage_path(conn, :update, planned_usage), planned_usage: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit planned usage"
  end

  test "deletes chosen resource", %{conn: conn} do
    planned_usage = Repo.insert! %PlannedUsage{}
    conn = delete conn, planned_usage_path(conn, :delete, planned_usage)
    assert redirected_to(conn) == planned_usage_path(conn, :index)
    refute Repo.get(PlannedUsage, planned_usage.id)
  end
end
