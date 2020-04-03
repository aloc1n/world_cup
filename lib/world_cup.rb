class WorldCup
  attr_reader :year, :teams
  # attr_accessor :teams

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

  def active_players_by_position(position)
    all_active_players.find_all do |active_player|
      active_player.position == position
    end
  end

end
