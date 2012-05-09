require 'test_helper'

class FeebableTest < ActiveSupport::TestCase
  test "exists" do
    assert_kind_of Module, Feedable, "feedable isn't what it seems to be"
  end
end
