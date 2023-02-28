class CreateCategories < ActiveRecord::Migration[6.1]
  def up
    unless ActiveRecord::Base.connection.table_exists?(:categories)
      create_table :categories do |t|
        t.string :category

        t.timestamps
      end
    end
  end

  def down
    drop_table :categories, if_exists: true
  end
end
