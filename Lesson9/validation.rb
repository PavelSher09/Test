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
        type = validation[:type]
        args = validation[:args]


        case validation[:type]
        when :presence
          raise 'Presence Error' if value.nil? || value == ''
        when :format
          raise 'Format Error' if value !~ args
        when :type
          raise 'Type Error' unless value.is_a?(args)
        end
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
