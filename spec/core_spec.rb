# frozen_string_literal: true

require_relative "spec_helper"

RSpec.describe DayOffs::Core do
  describe "objectize_sources" do
    let!(:source) do
      Class.new(DayOffs::Sources::Base) do
        with_countries :RU
        with_name :source
        with_years 2023

        def call
          :source
        end
      end
    end
    let!(:another_source) do
      Class.new(DayOffs::Sources::Base) do
        with_countries :RU
        with_name :another_source
        with_years 2023

        def call
          :another_source
        end
      end
    end

    before do
      DayOffs.used_sources[:RU] = {
        2023 => [source, another_source]
      }
    end

    it "create country module with call method" do
      described_class.objectize_sources
      expect(DayOffs.const_defined?(:RU)).to be_truthy
      expect(DayOffs::RU.singleton_class.method_defined?(:call)).to be_truthy
    end
  end

  describe "call method in created country module" do
    before do
      described_class.objectize_sources
    end

    it "raise error if given year is not supported" do
      expect { DayOffs::RU.call(2024) }.to raise_error(DayOffs::Errors::UnsupportedYearError)
    end

    it "raise error if given unsupported source" do
      expect { DayOffs::RU.call(2023, source: :unsupported_source) }.to raise_error(DayOffs::Errors::SourceNotFoundError)
    end

    it "return value from default source" do
      expect(DayOffs::RU.call(2023)).to eq(:source)
    end

    it "return value from given source" do
      expect(DayOffs::RU.call(2023, source: :another_source)).to eq(:another_source)
    end
  end
end