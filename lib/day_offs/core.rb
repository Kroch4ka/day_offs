# frozen_string_literal: true

module DayOffs::Core
  class << self
    def objectize_sources
      DayOffs.used_sources.each do |country, year_sources_hash|
        DayOffs.const_set(country, Class.new).instance_eval do
          @sources = year_sources_hash
          @country = country

          def fetch(year, source = nil)
            raise DayOffs::Errors::UnsupportedYearError unless @sources[year]

            source = @sources[year].find { |s| s.source_name == source } || @sources[year].first
            source.call(year, @country)
          end
        end
      end
    end
  end
end
