class Question

  attr_accessor :num1, :num2, :operator

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @operator = [:+, :-, :*, :/].sample
  end

  def ask
    answer = num1.send(operator, num2)
    puts "What is #{num1} #{operator} #{num2} = #{answer}"
  end
end