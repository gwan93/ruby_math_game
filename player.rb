class Player
  attr_accessor :current_life, :name

  def initialize(name)
    @name = name
    @current_life = 3
  end

  def lose_life
    self.current_life = self.current_life - 1
  end

end