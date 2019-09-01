require_relative 'instance_counter'
require_relative 'validation'

class Station

  include InstanceCounter
  include Validation

  EMPTY_NAME_ERROR  = 'Name couldnt be empty'

  attr_reader  :name,  :trains

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    register_instance
    @@all_stations << self
  end

  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def validate!
    raise EMPTY_NAME_ERROR if name == ''
  end

  def to_s
    name
  end

end
