defmodule CareCostManager.BudgetTest do
  use CareCostManager.ModelCase

  alias CareCostManager.Budget

  @valid_attrs %{annual_dollars: "120.5", location: "some content", month: 42, year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Budget.changeset(%Budget{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Budget.changeset(%Budget{}, @invalid_attrs)
    refute changeset.valid?
  end
end
