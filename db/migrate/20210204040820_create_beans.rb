class CreateBeans < ActiveRecord::Migration[5.2]
  def change
    create_table :beans do |t|
      t.integer :user_id
      t.string :name
      t.string :image_id
      t.integer :price
      t.float :rate
      t.integer :refresh
      t.integer :bitter
      t.integer :body
      t.integer :fruity
      t.text :info

      t.timestamps
    end
  end
end
