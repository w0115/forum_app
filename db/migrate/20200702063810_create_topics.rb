class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.text    :title
      t.boolean :flag, default: true
      t.timestamps
    end
  end
end
