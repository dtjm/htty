#require File.expand_path("#{File.dirname __FILE__}/../command")
require File.expand_path("#{File.dirname __FILE__}/query_set")

module HTTY; end

class HTTY::CLI; end

module HTTY::CLI::Commands; end

# Encapsulates the _cd_ command.
class HTTY::CLI::Commands::Qs < HTTY::CLI::Command

  # Returns the command that the _cd_ command is an alias for.
  def self.alias_for
    HTTY::CLI::Commands::QuerySet
  end

end

