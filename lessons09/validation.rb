module Validation

  module ClassMethods

    def validate(attr, type, *arg)
      @validation ||= []
      @validation << [attr.to_sym, type.to_sym, arg.first]
    end
  end

  module InstanceMethods

    def validate!
      self.class.instance_variable_get(:@validation).each do |value|
        self.send "#{value[1]}", value[0], value[2]
      end
    end

    def valid?
      begin
        validate!
        true
      rescue
        false
      end
    end

    private

    def var_value(attr)
      self.instance_variable_get("@#{attr}")
    end

    def presence(attr, *arg)
      raise "'#{attr}' is empty" if var_value(attr).to_s.empty?
    end

    def format(attr, arg)
      unless var_value(attr) =~ arg
        raise "Format of '#{attr}' is wrong"
      end
    end

    def type(attr, arg)
      unless var_value(attr).is_a?(arg)
        raise "Type of '#{attr}' is wrong"
      end
    end
  end
end
