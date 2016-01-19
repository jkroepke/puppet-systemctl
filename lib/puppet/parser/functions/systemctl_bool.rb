module Puppet::Parser::Functions
  newfunction(:systemctl_bool, :type => :rvalue, :doc => <<-EOS
    Return 'Yes' on true, 'No' on false
  EOS
  ) do |arguments|

    raise(Puppet::ParseError, "bool_systemd(): First Argument must be an boolean, " +
        "given #{arguments.class}.") if arguments.is_a?(FalseClass)

    return "'Yes'" if arguments[0] == true
    return "'No'" if arguments[0] == false
  end
end