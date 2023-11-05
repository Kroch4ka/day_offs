# frozen_string_literal: true

module DayOffs::Sources::Utils
  class << self
    def valid_country_alpha2_code?(country_code)
      !!(country_code =~ /^[A-Z]{2}$/)
    end

    def valid_year?(year)
      !!(year.to_s =~ /^[0-9]{4}$/)
    end
  end
end
