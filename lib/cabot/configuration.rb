# Cabot Gem Definition (CGD)
module Cabot
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  #

  # Cabot Configuration Class (CCC)
  class Configuration
    attr_accessor :symbolize_keys

    def initialize
      @symbolize_keys = true
    end
  end
end
