# frozen_string_literal: true

require_relative "../spec_helper.rb"

RSpec.describe DayOffs::Sources::Utils do
  describe "valid_country_alpha2_code?" do
    it "return true if given correct alpha 2 code" do
      expect(described_class.valid_country_alpha2_code?(:RU)).to be_truthy
    end

    it "return false if not given correct alpha 2 code" do
      expect(described_class.valid_country_alpha2_code?(:RUS)).to be_falsey
    end
  end

  describe "valid_year?" do
    it "return true if given correct year" do
      expect(described_class.valid_year?(2023)).to be_truthy
    end

    it "return false if not given correct alpha 2 code" do
      expect(described_class.valid_year?(23)).to be_falsey
    end
  end
end