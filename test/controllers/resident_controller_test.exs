defmodule CareCostManager.ResidentControllerTest do
  use CareCostManager.ConnCase

  alias CareCostManager.Resident
  @valid_attrs %{first_name: "some content", last_name: "some content", room_number: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, resident_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing residents"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, resident_path(conn, :new)
    assert html_response(conn, 200) =~ "New resident"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, resident_path(conn, :create), resident: @valid_attrs
    assert redirected_to(conn) == resident_path(conn, :index)
    assert Repo.get_by(Resident, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, resident_path(conn, :create), resident: @invalid_attrs
    assert html_response(conn, 200) =~ "New resident"
  end

  test "shows chosen resource", %{conn: conn} do
    resident = Repo.insert! %Resident{}
    conn = get conn, resident_path(conn, :show, resident)
    assert html_response(conn, 200) =~ "Show resident"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, resident_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    resident = Repo.insert! %Resident{}
    conn = get conn, resident_path(conn, :edit, resident)
    assert html_response(conn, 200) =~ "Edit resident"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    resident = Repo.insert! %Resident{}
    conn = put conn, resident_path(conn, :update, resident), resident: @valid_attrs
    assert redirected_to(conn) == resident_path(conn, :show, resident)
    assert Repo.get_by(Resident, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    resident = Repo.insert! %Resident{}
    conn = put conn, resident_path(conn, :update, resident), resident: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit resident"
  end

  test "deletes chosen resource", %{conn: conn} do
    resident = Repo.insert! %Resident{}
    conn = delete conn, resident_path(conn, :delete, resident)
    assert redirected_to(conn) == resident_path(conn, :index)
    refute Repo.get(Resident, resident.id)
  end
end
