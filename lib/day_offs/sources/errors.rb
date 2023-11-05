# frozen_string_literal: true

module DayOffs::Sources::Errors
  class IncorrectAlpha2CountryError < StandardError; end
  class IncorrectYearError < StandardError; end
  class UnimplementedMethodError < StandardError; end
end
