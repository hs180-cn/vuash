class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.uuid :secret, null: false, unique: true
      t.text :body, null: false

      t.timestamps null: false

      t.index :secret, unique: true
    end
  end
end
