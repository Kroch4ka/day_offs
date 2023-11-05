# frozen_string_literal: true

class DayOffs::Sources::Base
  attr_reader :country, :year

  def initialize(year, country)
    @year = year
    @country = country
  end

  def call
    raise DayOffs::Sources::Errors::UnimplementedMethodError
  end

  class << self
    def call(year, country)
      new(year, country).call
    end

    private

    def inherited(subclass)
      super
      DayOffs.registered_sources << subclass
      subclass.instance_exec do
        extend DayOffs::Sources::DSL
      end
    end
  end
end
