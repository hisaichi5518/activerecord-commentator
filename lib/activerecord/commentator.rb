require "activerecord/commentator/version"

module Activerecord
  module Commentator
    module Config
      include ActiveSupport::Configurable
      config_accessor :paths, instance_accessor: false do
        [/#{Regexp.quote(Rails.root.join("app").to_s)}|#{Regexp.quote(Rails.root.join("lib").to_s)}/]
      end
    end

    def execute(sql, name = nil)
      super(comment_to_sql(sql, fetch_execute_location), name)
    end

    private
    def fetch_execute_location
      locations = caller_locations.select do |location|
        Config.paths.any? { |re| re.match(location.absolute_path) }
      end

      locations.first
    end

    def comment_to_sql(sql, comment)
      return sql unless comment
      sql + " /* #{comment} */ "
    end
  end
end
