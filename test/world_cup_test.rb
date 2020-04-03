require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'pry'

class World_CupTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_instance_of WorldCup, world_cup
  end

  def test_it_has_a_year
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal 2018, world_cup.year
  end

  def test_it_has_teams
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [france, croatia], world_cup.teams
  end

  def test_it_has_active_players_by_position
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [pogba, modric], world_cup.active_players_by_position("midfielder")
  end

  def test_players_not_eliminated
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [mbappe, pogba, modric, vida], world_cup.all_active_players
  end

  def test_players_eliminated
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)
    croatia.eliminated = true
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [pogba], world_cup.active_players_by_position("midfielder")
  end

end
