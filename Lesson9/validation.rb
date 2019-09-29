module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validates

    def validate(name, type, *args)
      @validates ||= []
      @validates << { name: name, type: type, args: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |validation|
        var_name = "@#{validation[:name]}".to_sym
        value = instance_variable_get(var_name)

        send("validation_#{validation[:type]}", value, *validation[:args])
      end
    end

    def validation_presence(name)
      raise 'Presence Error' if name.nil? || name == ''
    end

    def validation_format(name, format)
      raise 'Format Error' if name !~ format
    end

    def validation_type(name, type)
      raise 'Type Error' if name.class != type
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
