require "active_record/commentator/version"
require "active_record/commentator/configuration"

module ActiveRecord
  module Commentator
    # ActiveRecord::ConnectionAdapters::DatabaseStatements#execute
    def execute(sql, name = nil)
      new_sql = write_comment_to_sql(sql, fetch_execute_location)
      super(new_sql, name)
    end

    private
    def fetch_execute_location
      locations = caller_locations.select do |location|
        ::ActiveRecord::Commentator::Configuration.paths.any? { |re| re.match(location.absolute_path) }
      end

      locations.first
    end

    def write_comment_to_sql(sql, comment)
      return sql unless comment
      sql + " /* #{comment} */ "
    end
  end
end
