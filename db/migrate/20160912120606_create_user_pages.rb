class CreateUserPages < ActiveRecord::Migration
  def change
    create_table :user_pages do |t|
      t.integer :user_id
      t.string :name
      t.text :post
      t.integer :like

      t.timestamps
    end
  end
end
