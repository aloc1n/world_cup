class Player
  attr_reader :name, :position

  def initialize(player_data)
    @name = player_data[:name]
    @position = player_data[:position]
  end
end
