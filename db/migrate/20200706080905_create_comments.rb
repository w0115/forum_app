class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :topic_id
      t.boolean :flag, default: true
      t.timestamps
    end
  end
end
