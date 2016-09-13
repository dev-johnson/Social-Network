class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :user_page_id
      t.string  :holder
      t.text :comment_line

      t.timestamps
    end
  end
end
