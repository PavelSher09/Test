module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

module ClassMethods
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history".to_sym) }
      define_method("#{name}=") do |value|
        previous_value = instance_variable_get(var_name)
        instance_variable_set(var_name, value)
        history_values = instance_variable_get("@#{name}_history".to_sym) || []
        instance_variable_set("@#{name}_history", history_values << previous_value)
      end
    end
  end

  def strong_attr_accessor(attr_name, attr_class)
    define_method(attr_name) { instance_variable_get("@#{attr_name}") }
    define_method("#{attr_name}=") do |value|
      raise "Type should be #{attr_class}" unless value.is_a?(attr_class)
      instance_variable_set("@#{attr_name}", value)
    end
  end
end

end
