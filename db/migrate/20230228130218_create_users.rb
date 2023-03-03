class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    unless ActiveRecord::Base.connection.table_exists?(:users)
      create_table :users do |t|
        t.string :name
        t.string :email
        t.integer :phone_number
        t.string :password

        t.timestamps
      end
    end
  end

  def down
    drop_table :users, if_exists: true
  end
end
