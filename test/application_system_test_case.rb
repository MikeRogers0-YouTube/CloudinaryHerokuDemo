require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  # For for what ever block is passed in to equal true, handy for when waiting for
  # an upload to complete.
  def wait_for(&block)
    begin
      Timeout.timeout(Capybara.default_max_wait_time) do
        loop until yield
      end
    rescue Timeout::Error
    end
  end
end
