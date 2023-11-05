# frozen_string_literal: true

require "day_offs"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.when_first_matching_example_defined(:clearable_sources) do
    config.around(:example) do |ex|
      DayOffs.registered_sources = []
      DayOffs.used_sources = {}
      ex.run
      DayOffs.registered_sources = []
      DayOffs.used_sources = {}
    end
  end
end
