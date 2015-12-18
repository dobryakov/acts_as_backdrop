acts_as_backdrop
----------------

This gem allows you to write async processing code to your models right into your models code.

[![Build Status](https://travis-ci.org/dobryakov/acts_as_backdrop.svg)](https://travis-ci.org/dobryakov/acts_as_backdrop)
[![Gem Version](https://badge.fury.io/rb/act_as_backdrop.svg)](https://badge.fury.io/rb/act_as_backdrop)
[![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/act_as_backdrop?type=total)]

Example
-------

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

      end

    end

Why
---

Because you might need to process some data *after* the model is saved, asynchronously.

Installation
------------

    gem 'act_as_backdrop' # Gemfile
    require 'backdrop'    # application.rb

How it works
------------

When your model instance saved (on after_commit callback), the model itself and it's changes published to async job queue as usual DelayedJob.
The special worker (BackdropJob class) will process this message and will trigger your 'backdrop_process' method inside your model.

You receive full information about model changes, and can process it as you wish. If you change the model state at this step, the next async task will happen and be processed in same way.

History
-------

0.0.4: changed from 'after_save' to 'after_commit'.
