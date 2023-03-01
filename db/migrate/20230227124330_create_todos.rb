class CreateTodos < ActiveRecord::Migration[6.1]
  def up
    unless ActiveRecord::Base.connection.table_exists?(:todos)
      create_table :todos do |t|
        t.string :name
        t.string :description
        t.references :category, null: false, foreign_key: true

        t.timestamps
      end
    end
  end

  def down
    drop_table :todos, if_exists: true
  end
end
