module Game
  def input_to_index(input)
    input.to_i - 1
  end

  def current_player(playe1, playe2)
    turn_count.even? ? playe2 : playe1
  end
end
