class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :user_page_id
      t.integer :comment_id
      t.string :like_status

      t.timestamps
    end
  end
end
