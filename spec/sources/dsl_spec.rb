# frozen_string_literal: true

require_relative "../spec_helper"

RSpec.describe DayOffs::Sources::DSL do
  let(:klass) { Class.new(DayOffs::Sources::Base) }

  before { klass.extend(described_class) }

  describe "extended" do
    it "define class instance variables" do
      expect(klass.instance_variable_defined?(:@countries)).to eq(true)
      expect(klass.instance_variable_defined?(:@years)).to eq(true)
    end

    it "define attr accessors" do
      expect(klass.singleton_class.method_defined?(:countries)).to eq(true)
      expect(klass.singleton_class.method_defined?(:years)).to eq(true)
      expect(klass.singleton_class.method_defined?(:source_name))
      expect(klass.singleton_class.method_defined?(:countries=)).to eq(true)
      expect(klass.singleton_class.method_defined?(:years=)).to eq(true)
      expect(klass.singleton_class.method_defined?(:source_name=)).to eq(true)
    end
  end

  describe "with_countries" do
    it "add values to class instance variable" do
      klass.send(:with_countries, :ru, :en)
      expect(klass.countries).to eq(%i[RU EN])
    end
  end

  describe "with_source_name" do
    it "assign value to class instance variable" do
      klass.send(:with_name, :super_source)
      expect(klass.source_name).to eq(:super_source)
    end
  end

  describe "with_years" do
    it "add values to class instance variable" do
      klass.send(:with_years, 2023, 2024)
      expect(klass.years).to eq([2023, 2024])
    end
  end
end
