defmodule BowlingTest do
  use ExUnit.Case

  test "gutter game" do
    game = List.duplicate([0, 0], 9) ++ [[0, 0, nil]]
    assert Bowling.score(game) == 0
  end

  test "'all ones' game" do
    game = List.duplicate([1, 1], 9) ++ [[1, 1, nil]]
    assert Bowling.score(game) == 20
  end

  test "one spare" do
    game = [[5,5],[3,0]] ++ List.duplicate([0, 0], 7) ++ [[0, 0, nil]]
    assert Bowling.score(game) == 16
  end

  test "one strike" do
    game = [[10, nil],[3,4]] ++ List.duplicate([0, 0], 7) ++ [[0, 0, nil]]
    assert Bowling.score(game) == 24
  end

  test "perfect game" do
    game = List.duplicate([10, nil], 9) ++ [[10,10,10]]
    assert Bowling.score(game) == 300
  end


  # Extra Tests

  test "Strike in 9th and no bonus in 10th frames -- forces boundary case in line 12 of implementation" do
    game = List.duplicate([0, nil], 8) ++ [[10, nil], [5, 1, nil]]
    assert Bowling.score(game) == 22
  end

  test "Spare in 9th and no bonus in 10th frames" do
    game = List.duplicate([0, nil], 8) ++ [[0, 10], [5, 1, nil]]
    assert Bowling.score(game) == 21
  end

  test "Spares in second roll" do
    game = List.duplicate([0, 10], 9) ++ [[0, 10, 1]]
    assert Bowling.score(game) == 101
  end

  test "strike in 9th and spare 10th frames" do
    game =  List.duplicate([0, 0], 8) ++ [[10, nil], [0, 10, 3]]
    assert Bowling.score(game) == 33
  end

  test "strike in 8th and 9th frames" do
    game =  List.duplicate([0, 0], 7) ++ [[10, nil], [10, nil], [1, 1, nil]]
    assert Bowling.score(game) == 35
  end

  test "one strike followed by one spare" do
    game = [[2, 3], [10, nil], [5, 5], [3, 2]] ++ List.duplicate([0, 0], 5) ++ [[0, 0, nil]]
    assert Bowling.score(game) == 43
  end

  test "spare in 10th frame" do
    game =  List.duplicate([0, 0], 9) ++ [[5, 5, 3]]
    assert Bowling.score(game) == 13
  end

  test "normal score only in the last frame" do
    game =  List.duplicate([0, 0], 9) ++ [[1, 5, nil]]
    assert Bowling.score(game) == 6
  end
end
