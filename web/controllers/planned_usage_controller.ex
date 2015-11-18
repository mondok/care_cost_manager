defmodule CareCostManager.PlannedUsageController do
  use CareCostManager.Web, :controller

  alias CareCostManager.PlannedUsage

  plug :scrub_params, "planned_usage" when action in [:create, :update]

  def index(conn, _params) do
    planned_usages = Repo.all(PlannedUsage)
    render(conn, "index.html", planned_usages: planned_usages)
  end

  def new(conn, _params) do
    changeset = PlannedUsage.changeset(%PlannedUsage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"planned_usage" => planned_usage_params}) do
    changeset = PlannedUsage.changeset(%PlannedUsage{}, planned_usage_params)

    case Repo.insert(changeset) do
      {:ok, _planned_usage} ->
        conn
        |> put_flash(:info, "Planned usage created successfully.")
        |> redirect(to: planned_usage_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    planned_usage = Repo.get!(PlannedUsage, id)
    render(conn, "show.html", planned_usage: planned_usage)
  end

  def edit(conn, %{"id" => id}) do
    planned_usage = Repo.get!(PlannedUsage, id)
    changeset = PlannedUsage.changeset(planned_usage)
    render(conn, "edit.html", planned_usage: planned_usage, changeset: changeset)
  end

  def update(conn, %{"id" => id, "planned_usage" => planned_usage_params}) do
    planned_usage = Repo.get!(PlannedUsage, id)
    changeset = PlannedUsage.changeset(planned_usage, planned_usage_params)

    case Repo.update(changeset) do
      {:ok, planned_usage} ->
        conn
        |> put_flash(:info, "Planned usage updated successfully.")
        |> redirect(to: planned_usage_path(conn, :show, planned_usage))
      {:error, changeset} ->
        render(conn, "edit.html", planned_usage: planned_usage, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    planned_usage = Repo.get!(PlannedUsage, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(planned_usage)

    conn
    |> put_flash(:info, "Planned usage deleted successfully.")
    |> redirect(to: planned_usage_path(conn, :index))
  end
end
