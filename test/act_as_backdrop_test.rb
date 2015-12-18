
require 'test_helper'

class ActAsBackdropTest < ActiveSupport::TestCase

  def test_model_act_as_backdrop

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

    model.title = 'something better'
    model.save
    model.run_callbacks(:commit)

    assert_equal 'something better', File.read('check.txt')

  end

end