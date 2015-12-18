require 'test_helper'

class SomethingTest < ActiveSupport::TestCase

  test 'backdrop_test' do

    model = Something.new
    model.save

    model.title = 'abc'
    model.save

    model.title = 'def'
    model.save

    model.title = 'something better'
    model.save

    model.reload
    assert_equal 'def', model.check

  end

end
