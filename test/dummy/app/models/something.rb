class Something < ActiveRecord::Base
  acts_as_backdrop

  def backdrop_process(message)

    # This will be processed asyncronously after model save.
    # Example that you receive as 'message' variable:
    #
    # { "class"   => "Something",
    #   "gid"     => "gid://dummy/Something/1",
    #   "changes" => {
    #     "title"      => [nil, "abc"],
    #     "created_at" => [nil, "2015-12-17T20:28:52.307Z"],
    #     "updated_at" => [nil, "2015-12-17T20:28:52.307Z"],
    #     "id"         => [nil, 1]
    #   }
    # }

    # for example, we put changes of the title into 'check' attribute to check them in tests
    if message['changes'].present? && message['changes']['title'].present?
      old_title = message['changes']['title'].first
      new_title = message['changes']['title'].last
      self.update(:check => new_title)
    end

  end

end
