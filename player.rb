class Player
  attr_accessor :current_life

  def initialize
    @current_life = 3
  end

  def lose_life
    self.current_life = self.current_life - 1
  end

end