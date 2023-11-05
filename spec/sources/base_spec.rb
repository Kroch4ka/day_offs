# frozen_string_literal: true

require_relative "../spec_helper"

RSpec.describe DayOffs::Sources::Base, :clearable_sources do
  describe "inherited" do
    it "register source when inherit from klass" do
      expect { Class.new(described_class) }.to change(DayOffs.registered_sources, :size).from(0).to(1)
      expect(DayOffs.registered_sources.last.ancestors).to include(described_class)
      expect(DayOffs.registered_sources.last).to be_a(DayOffs::Sources::DSL)
    end
  end
end
