require "leveldb"

module Ruboty
  module Brains
    class Leveldb < Base
      KEY = "brain"

      env :LEVELDB_PATH, "LevelDB path (default: ruboty.ldb)", optional: true
      env :LEVELDB_SAVE_INTERVAL,
        "Interval sec to save data to LevelDB (default: 5)",
        optional: true

      def initialize
        super
        @thread = Thread.new { sync }
        @thread.abort_on_exception = true
      end

      def data
        @data ||= pull || {}
      end

      private

      def db
        @db ||= LevelDB::DB.new(db_file)
      end

      def db_file
        ENV["LEVELDB_FILE"] || "ruboty.ldb"
      end

      def interval
        (ENV["LEVELDB_SAVE_INTERVAL"] || 5).to_i
      end

      def pull
        if str = db[KEY]
          Marshal.load(str)
        end
      end

      def push
        db[KEY] = Marshal.dump(data)
      end

      def sync
        loop do
          wait
          push
        end
      end

      def wait
        sleep(interval)
      end
    end
  end
end

