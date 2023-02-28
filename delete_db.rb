require 'sqlite3'

# Specify the path to the database file
db_path = './db/development.sqlite3'

# Open a connection to the database
db = SQLite3::Database.new(db_path)

# Get a list of tables in the database
tables = db.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;")

# Loop through each table and delete the data
tables.each do |table|
  table_name = table[0]
  db.execute("DELETE FROM #{table_name};")
end

puts "All data has been deleted from the database."