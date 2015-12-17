require 'backdrop/act_as_backdrop'
require 'backdrop/backdrop_job'

module Backdrop
  class Event
    def self.publish(payload)

      klass   = payload[:model].class.to_s
      gid     = payload[:model].to_global_id.to_s
      changes = payload[:changes]

      message = {
        class:   klass,
        gid:     gid,
        changes: changes
      }

      BackdropJob.perform_later message.to_json

    end
  end
end
