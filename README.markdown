acts_as_backdrop
----------------

This gem allows you to write async processing code to your models right into your models code.

[![Gem Version](https://badge.fury.io/rb/act_as_backdrop.svg)](https://badge.fury.io/rb/act_as_backdrop)

Example
-------

    class Something < ActiveRecord::Base
      acts_as_backdrop

      def backdrop_process(message)

        # example that you receive:
        # { "class"=>"Something",
        #   "gid"=>"gid://dummy/Something/1",
        #   "changes"=>{"title"=>[nil, "abc"],
        #   "created_at"=>[nil, "2015-12-17T20:28:52.307Z"],
        #   "updated_at"=>[nil, "2015-12-17T20:28:52.307Z"],
        #   "id"=>[nil, 1]} }

      end

    end

Why
---

Because you might need to process some data *after* the model is saved, asynchronously.

How it works
------------

When your model instance saved (on after_save callback), the model itself and it's changes published to async job queue as usual DelayedJob.
The special worker (BackdropJob class) will process this message and will trigger your 'backdrop_process' method inside your model.

You receive full information about model changes, and can process it as you wish.