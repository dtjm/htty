require File.expand_path("#{File.dirname __FILE__}/../command")

module HTTY; end

class HTTY::CLI; end

module HTTY::CLI::Commands; end

# Encapsulates the _ssl-verify_ command.
class HTTY::CLI::Commands::SslVerify < HTTY::CLI::Command

  @@options = ['on', 'off']

  # Returns the name of a category under which help for the _ssl-verify_
  # command should appear.
  def self.category
      'Issuing Requests'
  end

  # Returns the arguments for the command-line usage of the _ssl-verify_
  # command.
  def self.command_line_arguments
    '[on|off]'
  end

  # Returns the help text for the _ssl-verify_ command.
  def self.help
    'Sets the SSL certificate verification mode.'
  end

  # Returns the extended help text for the _ssl-verify_ command.
  def self.help_extended
    ""
  end

  # Returns related command classes for the _ssl-verify_ command.
  def self.see_also_commands
    [HTTY::CLI::Commands::BodyResponse]
  end

  # Performs the _ssl-verify_ command.
  def perform
    add_request_if_has_response do |request|

      if arguments.empty?
        puts self.class.current_status request

      elsif !@@options.include? arguments[0]
        puts "Arguments for #{self.class.command_line}:"
        puts self.class.help_extended

      else
        case arguments[0]
        when 'on'
          request.ssl_verify = true
        when 'off'
          request.ssl_verify = false
        end
    
        puts self.class.current_status request
      end    

      request
    end
  end

  def self.current_status(request)
    if request.ssl_verify
      "ssl_verify: on"
    else
      "ssl_verify: off"
    end
  end


end

