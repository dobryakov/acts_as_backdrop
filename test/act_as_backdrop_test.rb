
require 'test_helper'

class ActAsBackdropTest < ActiveSupport::TestCase

  def test_model_act_as_backdrop
    model = Something.new(:title => 'abc')
    model.save
    model.title = 'def'
    model.save
  end

end