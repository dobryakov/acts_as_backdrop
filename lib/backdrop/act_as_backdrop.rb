module Backdrop
  module ActAsBackdrop

    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_backdrop(options = {})
        include Backdrop::ActAsBackdrop::LocalInstanceMethods
        #after_save :acts_as_backdrop
        after_commit :acts_as_backdrop, on: [:create, :update]
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
