defmodule CareCostManager.PlannedUsageTest do
  use CareCostManager.ModelCase

  alias CareCostManager.PlannedUsage

  @valid_attrs %{shift: "some content", size: "some content", transaction_date: "2010-04-17 14:00:00", usage: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PlannedUsage.changeset(%PlannedUsage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PlannedUsage.changeset(%PlannedUsage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
