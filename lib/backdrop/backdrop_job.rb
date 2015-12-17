class BackdropJob < ActiveJob::Base

  queue_as :default

  def perform(message_json)
    message = JSON.parse(message_json)
    model   = GlobalID::Locator.locate message['gid']
    model.send(:backdrop_process, message) if model.present? && model.respond_to?(:backdrop_process)
  end

end