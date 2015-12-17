
require 'test_helper'

class ActAsBackdropTest < ActiveSupport::TestCase

  def test_model_act_as_backdrop

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