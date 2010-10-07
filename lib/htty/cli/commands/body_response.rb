require File.expand_path("#{File.dirname __FILE__}/../../no_response_error")
require File.expand_path("#{File.dirname __FILE__}/../command")
require File.expand_path("#{File.dirname __FILE__}/body_request")
require File.expand_path("#{File.dirname __FILE__}/headers_response")
require File.expand_path("#{File.dirname __FILE__}/status")
require 'json'

module HTTY; end

class HTTY::CLI; end

module HTTY::CLI::Commands; end

# Encapsulates the _body-response_ command.
class HTTY::CLI::Commands::BodyResponse < HTTY::CLI::Command

  # Returns the name of a category under which help for the _body_ command
  # should appear.
  def self.category
    'Inspecting Responses'
  end

  # Returns the string used to invoke the _body-response_ command from the
  # command line.
  def self.command_line
    'body[-response]'
  end

  # Returns the help text for the _body-response_ command.
  def self.help
    'Displays the body of the response'
  end

  # Returns the extended help text for the _body-response_ command.
  def self.help_extended
    'Displays the body content received in the response. Does not ' +
    'communicate with the host.'
  end

  # Returns related command classes for the _body-response_ command.
  def self.see_also_commands
    [HTTY::CLI::Commands::HeadersResponse,
     HTTY::CLI::Commands::Status,
     HTTY::CLI::Commands::BodyRequest]
  end

  # Performs the _body-response_ command.
  def perform
    unless (response = session.last_response)
      raise HTTY::NoResponseError
    end
        
    unless (body = response.body).to_s.empty?

        # Output the body based on the JSON format option
        case session.options[:json_format]

        when 'on'
            puts JSON.pretty_generate JSON.parse body

        when 'off'
            puts body

        when 'auto'
            begin
                puts JSON.pretty_generate JSON.parse body
            rescue
                puts body
            end
        end
    end
    
    self
  end

end
