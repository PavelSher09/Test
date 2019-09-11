class Wagon
  
  NOT_ENOUGH_SPACE = 'Not enough space!'
  
  attr_reader :number,  :space
  attr_accessor :needed_space

  @@wagon_num = 0

  def initialize(space)
    @number = @@wagon_num += 1
    @space = space
    @needed_space = 0
  end

  def free_space
    space - needed_space
  end

  def reserve_space(amount)
    raise NOT_ENOUGH_SPACE if amount > free_space
    self.needed_space += amount
  end

  def to_s
    puts "wagon: #{number}, used: #{needed_space}, free: #{free_space}."
  end
end
