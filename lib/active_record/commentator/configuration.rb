require "active_support/configurable"

module ActiveRecord
  module Commentator
    module Configuration
      include ActiveSupport::Configurable

      config_accessor :paths, instance_accessor: false do
        []
      end
    end
  end
end

