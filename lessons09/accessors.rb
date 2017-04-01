module Accessor

  def attr_accessor_with_history(*attrs)
    attrs.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        @history ||= {}
        @history[var_name] ||= []
        @history[var_name] << value
      end
      define_method("#{name}_history") { @history[var_name] }
    end
  end

  def strong_attr_accessor(attr_name, attr_class)
    var_name = "@#{attr_name}".to_sym
    define_method(attr_name) { instance_variable_get(var_name) }
    define_method("#{attr_name}=".to_sym) do |value|
      raise 'wrong attribute class' unless value.class.to_s == attr_class.to_s
      instance_variable_set(var_name, value)
    end
  end

end

class Test
  extend Accessor
  attr_accessor_with_history :my_attr1, :my_attr2
  strong_attr_accessor(:strong, Integer)
end
