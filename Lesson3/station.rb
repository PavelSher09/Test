class Station

  attr_reader :name, :stations
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end
  
  def send_train(train)
    @trains.delete(train)
  end

end
