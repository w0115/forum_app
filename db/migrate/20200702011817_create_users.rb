class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :flag, default: true
      t.timestamps
    end
  end
end
