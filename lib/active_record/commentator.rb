require "active_record/commentator/version"
require "active_record/commentator/configuration"

module ActiveRecord
  module Commentator
    # ActiveRecord::ConnectionAdapters::DatabaseStatements#execute
    def execute(sql, name = nil)
      super(comment_to_sql(sql, fetch_execute_location), name)
    end

    private
    def fetch_execute_location
      locations = caller_locations.select do |location|
        ::ActiveRecord::Commentator::Configuration.paths.any? { |re| re.match(location.absolute_path) }
      end

      locations.first
    end

    def comment_to_sql(sql, comment)
      return sql unless comment
      sql + " /* #{comment} */ "
    end
  end
end