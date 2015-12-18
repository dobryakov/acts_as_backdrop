require 'test_helper'

class SomethingTest < ActiveSupport::TestCase

  test 'backdrop_test' do

    model = Something.new
    model.save
    model.run_callbacks(:commit)

    model.title = 'abc'
    model.save
    model.run_callbacks(:commit)

    assert_equal 'abc', File.read('check.txt')

    model.title = 'def'
    model.save
    model.run_callbacks(:commit)

    assert_equal 'def', File.read('check.txt')

    model.title = 'something inside your model'
    model.save
    model.run_callbacks(:commit)

    assert_equal 'something inside your model', File.read('check.txt')

  end

end
