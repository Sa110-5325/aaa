class CreateBeans < ActiveRecord::Migration[5.2]
  def change
    create_table :beans do |t|
      t.integer :user_id
      t.integer :name
      t.string :image_id
      t.integer :price
      t.text :info

      t.timestamps
    end
  end
end
