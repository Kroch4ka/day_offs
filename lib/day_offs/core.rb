# frozen_string_literal: true

module DayOffs::Core
  class << self
    def objectize_sources
      DayOffs.used_sources.each do |country, year_sources_hash|
        DayOffs.const_set(country, Class.new).instance_eval do
          @sources = year_sources_hash
          @country = country

          def call(year, source: nil)
            raise DayOffs::Errors::UnsupportedYearError unless @sources[year]

            if source
              source = @sources[year].find { |s| s.source_name == source }
              raise DayOffs::Errors::SourceNotFoundError unless source
            end
            source ||= @sources[year].first
            source.call(year, @country)
          end
        end
      end
    end
  end
end
