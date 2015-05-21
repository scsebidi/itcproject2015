class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :gender
      t.string :idnumber
      t.string :marital_status
      t.string :race

      t.timestamps
    end
  end
end
