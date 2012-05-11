require 'active_record'

module Feedable
  module FeedableRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def feedable(col)
        class_attribute :feedable_col
        self.feedable_col = col
      end
    end
  end
end

ActiveRecord::Base.send :include, Feedable::FeedableRecord
