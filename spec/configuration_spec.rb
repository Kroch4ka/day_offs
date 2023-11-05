# frozen_string_literal: true

require_relative "spec_helper"

RSpec.describe DayOffs::Configuration, :clearable_sources do
  let!(:source) do
    Class.new(DayOffs::Sources::Base) do
      with_countries :RU, :EN
      with_name :example
      with_years 2023, 2024
    end
  end
  let(:config) { described_class.new }

  describe "use_sources" do
    it "add to used sources list when given klass" do
      config.use_sources(source)
      expect(DayOffs.used_sources[:RU][2023].first).to eql(source)
      expect(DayOffs.used_sources[:EN][2023].first).to eql(source)
      expect(DayOffs.used_sources[:RU][2024].first).to eql(source)
      expect(DayOffs.used_sources[:EN][2024].first).to eql(source)
    end

    it "add to used sources list when given symbol" do
      config.use_sources(:example)
      expect(DayOffs.used_sources[:RU][2023].first).to eql(source)
      expect(DayOffs.used_sources[:EN][2023].first).to eql(source)
      expect(DayOffs.used_sources[:RU][2024].first).to eql(source)
      expect(DayOffs.used_sources[:EN][2024].first).to eql(source)
    end
  end
end
