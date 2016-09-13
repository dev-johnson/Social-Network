class CreateUserPages < ActiveRecord::Migration
  def change
    create_table :user_pages do |t|
      t.string :comments


      t.timestamps
    end
  end
end
