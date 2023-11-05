# frozen_string_literal: true

# frozen_string_literal: true

require_relative "../spec_helper.rb"

RSpec.describe DayOffs::Sources::Validator do
  let(:utils_klass) { DayOffs::Sources::Utils }

  describe "validate_country" do
    context "when given correct country" do
      before { allow(utils_klass).to receive(:valid_country_alpha2_code?).and_return(true) }

      it "not raise error" do
        expect { described_class.validate_country(:RU) }.not_to raise_error
      end
    end

    context "when given correct country" do
      before { allow(utils_klass).to receive(:valid_country_alpha2_code?).and_return(false) }

      it "to raise error" do
        expect { described_class.validate_country(:RU) }
          .to raise_error(DayOffs::Sources::Errors::IncorrectAlpha2CountryError)
      end
    end
  end

  describe "validate_year" do
    context "when given correct year" do
      before { allow(utils_klass).to receive(:valid_year?).and_return(true) }

      it "not raise error" do
        expect { described_class.validate_year(2023) }.not_to raise_error
      end
    end

    context "when given correct year" do
      before { allow(utils_klass).to receive(:valid_year?).and_return(false) }

      it "to raise error" do
        expect { described_class.validate_year(:RU) }
          .to raise_error(DayOffs::Sources::Errors::IncorrectYearError)
      end
    end
  end
end
