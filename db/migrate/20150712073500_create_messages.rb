class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :uuid, null: false, unique: true
      t.binary :data, null: false, limit: 16.kilobytes + 32

      t.timestamps null: false

      t.index :uuid, unique: true
    end
  end
end
