require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_instance_of Player, player
  end

  def test_player_has_a_name
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_equal "Luka Modric", player.name
  end

  def test_player_has_position
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_equal "midfielder", player.position  
  end
end
