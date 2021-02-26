# frozen_string_literal: true

require 'pg'

# Database setup object
class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
