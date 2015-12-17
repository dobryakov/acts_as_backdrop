require 'backdrop/act_as_backdrop'
require 'backdrop/backdrop_job'

module Backdrop
  class Event
    def self.publish(payload)

      #p payload.as_json

      #event_name = "global.#{payload[:model].class.to_s.underscore}.update.success"
      klass   = payload[:model].class.to_s
      gid     = payload[:model].to_global_id.to_s
      changes = payload[:changes]

      message = {
        class:   klass,
        gid:     gid,
        changes: changes
      }

      #ActiveSupport::Notifications.instrument 'global.backdrop.event.do', message do
      #  p "Dispatching event #{message}"
      #end

      BackdropJob.perform_later message.to_json

    end
  end
end
