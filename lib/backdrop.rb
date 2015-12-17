require 'backdrop/act_as_backdrop'

module Backdrop
  class Event
    def self.publish(payload)

      #p payload.as_json

      event_name = "global.#{payload[:model].class.to_s.underscore}.update.success"

      ActiveSupport::Notifications.instrument event_name, payload do
        p "Dispatching event #{event_name}"
        p "with payload #{payload}"
      end

    end
  end
end
