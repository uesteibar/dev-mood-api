defmodule TwitterDevMood.LanguageTest do
  use TwitterDevMood.ModelCase

  alias TwitterDevMood.Language

  describe "with valid attributes" do
    @attrs %{mood: 42, occurrences: 42}

    test "changeset with valid attributes" do
      changeset = Language.changeset(%Language{}, @attrs)

      assert changeset.valid?
    end
  end

  describe "with invalid attributes" do
    @attrs %{mood: nil, occurrences: nil}

    test "changeset with invalid attributes" do
      changeset = Language.changeset(%Language{}, @attrs)

      refute changeset.valid?
    end
  end
end
