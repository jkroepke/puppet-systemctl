module Puppet::Parser::Functions
  newfunction(:bool_systemd, :type => :rvalue, :doc => <<-EOS
    Return 'Yes' on true, 'No' on false
  EOS
  ) do |arguments|

    raise(Puppet::ParseError, "bool_systemd(): First Argument must be an boolean, " +
        "given #{arguments.class}.") if arguments.is_a?(FalseClass)

    return 'yes' if arguments[0] == true
    return false if arguments[0] == false
  end
end