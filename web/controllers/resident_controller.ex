defmodule CareCostManager.ResidentController do
  use CareCostManager.Web, :controller

  alias CareCostManager.Resident

  plug :scrub_params, "resident" when action in [:create, :update]

  def index(conn, _params) do
    residents = Repo.all(Resident)
    render(conn, "index.html", residents: residents)
  end

  def new(conn, _params) do
    changeset = Resident.changeset(%Resident{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resident" => resident_params}) do
    changeset = Resident.changeset(%Resident{}, resident_params)

    case Repo.insert(changeset) do
      {:ok, _resident} ->
        conn
        |> put_flash(:info, "Resident created successfully.")
        |> redirect(to: resident_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resident = Repo.get!(Resident, id)
    render(conn, "show.html", resident: resident)
  end

  def edit(conn, %{"id" => id}) do
    resident = Repo.get!(Resident, id)
    changeset = Resident.changeset(resident)
    render(conn, "edit.html", resident: resident, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resident" => resident_params}) do
    resident = Repo.get!(Resident, id)
    changeset = Resident.changeset(resident, resident_params)

    case Repo.update(changeset) do
      {:ok, resident} ->
        conn
        |> put_flash(:info, "Resident updated successfully.")
        |> redirect(to: resident_path(conn, :show, resident))
      {:error, changeset} ->
        render(conn, "edit.html", resident: resident, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resident = Repo.get!(Resident, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(resident)

    conn
    |> put_flash(:info, "Resident deleted successfully.")
    |> redirect(to: resident_path(conn, :index))
  end
end
