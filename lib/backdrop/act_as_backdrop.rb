module Backdrop
  module ActAsBackdrop

    extend ActiveSupport::Concern

    included do
      after_save :acts_as_backdrop
    end

    module ClassMethods
      def acts_as_backdrop(options = {})
        include Backdrop::ActAsBackdrop::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def acts_as_backdrop(options = {})
        changes = self.previous_changes
        Backdrop::Event.publish model: self, changes: changes
      end
    end

  end
end

ActiveRecord::Base.include(Backdrop::ActAsBackdrop)
