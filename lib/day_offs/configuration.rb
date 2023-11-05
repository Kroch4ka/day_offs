# frozen_string_literal: true

class DayOffs::Configuration
  class UndefinedSourceError < StandardError; end

  def use_sources(*sources)
    sources.each { |source| use_source(source) }
  end

  private

  def use_source(source)
    source_klass = DayOffs.registered_sources.find { |src| src.source_name == source } if source.is_a?(Symbol)
    source_klass ||= source if source.respond_to?(:ancestors) && source.ancestors.include?(DayOffs::Sources::Base)

    raise UndefinedSourceError unless source_klass

    source_klass.countries.each do |country|
      source_klass.years.each do |year|
        DayOffs.used_sources[country] ||= {}
        DayOffs.used_sources[country][year] ||= []
        DayOffs.used_sources[country][year] << source_klass
      end
    end
  end
end
