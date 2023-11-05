# frozen_string_literal: true

require_relative "day_offs/version"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "dsl" => "DSL"
)
loader.setup

module DayOffs
  @registered_sources = []
  @used_sources = {}

  DayOff = Struct.new(:country, :date) do
    def ==(other)
      country == other.country && date == other.date
    end
  end

  class << self
    attr_reader :configuration
    attr_accessor :registered_sources, :used_sources

    def configure
      @configuration = yield(Configuration.new)
      DayOffs::Core.objectize_sources
    end
  end
end
