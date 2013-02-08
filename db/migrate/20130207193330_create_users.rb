class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_number
      t.integer :group_id

      t.timestamps
    end
  end
end
