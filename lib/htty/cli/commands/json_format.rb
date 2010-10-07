require File.expand_path("#{File.dirname __FILE__}/../command")

module HTTY; end

class HTTY::CLI; end

module HTTY::CLI::Commands; end

# Encapsulates the _json-format_ command.
class HTTY::CLI::Commands::JsonFormat < HTTY::CLI::Command

  @@options = ['on', 'off', 'auto']

  # Returns the name of a category under which help for the _json-format_
  # command should appear.
  def self.category
      'Inspecting Responses'
  end

  # Returns the arguments for the command-line usage of the _json-format_
  # command.
  def self.command_line_arguments
    '[on|off|auto]'
  end

  # Returns the help text for the _json-format_ command.
  def self.help
    'Sets the JSON formatting mode.'
  end

  # Returns the extended help text for the _json-format_ command.
  def self.help_extended
    "on - always format response as JSON (this will throw an error if the
    response is not valid JSON)

    off - never parse response as JSON

    auto - attempt to parse response as JSON if possible"
  end

  # Returns related command classes for the _json-format_ command.
  def self.see_also_commands
    [HTTY::CLI::Commands::BodyResponse]
  end

  # Performs the _json-format_ command.
  def perform
      if arguments.empty?
        puts "json_format: #{session.options[:json_format]}"
      elsif !@@options.include? arguments[0]
        puts "Arguments for #{self.class.command_line}:"
        puts self.class.help_extended
      else
        session.options[:json_format] = arguments[0]
        puts "json_format: #{session.options[:json_format]}"
      end

      self
  end

end
