require './lib/team'

class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def all_active_players
    active_teams = @teams.find_all {|team| !team.eliminated?}
    all_active_players_array = []

    active_teams.each do |active_team|
      all_active_players_array << active_team.players
    end
    all_active_players_array.flatten!
  end

  def active_players_by_position(position_str)
    @teams.select {|team| !team.eliminated?}.collect_concat do |team|
      team.players_by_position(position_str)
    end
  end

  def all_players_by_position
    @teams.collect_concat { |team| team.players}.group_by do |player|
      player.position
    end
  end

end
