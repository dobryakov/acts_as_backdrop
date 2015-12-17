module Backdrop
  module ActAsBackdrop

    extend ActiveSupport::Concern

    included do
      before_save :acts_as_backdrop
    end

    module ClassMethods
      def acts_as_backdrop(options = {})
        #cattr_accessor :yaffle_text_field
        #self.yaffle_text_field = (options[:yaffle_text_field] || :last_squawk).to_s
        include Backdrop::ActAsBackdrop::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def acts_as_backdrop(options = {})
        # тут будет ваш код
        self.title = 'suxxess'
        #Rails.logger.debug "IT'S RUN!!!!!!!!!!!!"
        #p "IT'S RUN!!!!!!!!!!!!"
        #"suxxess"
      end
    end

  end
end

ActiveRecord::Base.include(Backdrop::ActAsBackdrop)
