# frozen_string_literal: true

module DayOffs::Sources::DSL

  def with_countries(*countries_alpha2)
    verified_countries = countries_alpha2.map do |country|
      DayOffs::Sources::Validator.validate_country(country.upcase)
      country.upcase
    end

    self.countries = countries + verified_countries
  end

  def with_name(source_name)
    self.source_name = source_name
  end

  def with_years(*years)
    years.each { |year| DayOffs::Sources::Validator.validate_year(year.to_s) }
    self.years = self.years + years
  end
end
