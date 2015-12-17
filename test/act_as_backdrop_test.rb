
require 'test_helper'

class ActAsBackdropTest < ActiveSupport::TestCase

  def test_model_act_as_backdrop
    model = Something.new
    model.save
    assert_equal 'suxxess', model.title
    assert model.persisted?
  end

end