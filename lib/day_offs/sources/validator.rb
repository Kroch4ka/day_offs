# frozen_string_literal: true

module DayOffs::Sources::Validator
  class << self
    def validate_country(country)
      unless DayOffs::Sources::Utils.valid_country_alpha2_code?(country)
        raise DayOffs::Sources::Errors::IncorrectAlpha2CountryError
      end
    end

    def validate_year(year)
      unless DayOffs::Sources::Utils.valid_year?(year)
        raise DayOffs::Sources::Errors::IncorrectYearError
      end
    end
  end
end
