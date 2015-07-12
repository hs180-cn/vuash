class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :uuid, null: false, unique: true
      t.column :data, :bytea, null: false
      # t.text :body, null: false

      t.timestamps null: false

      t.index :uuid, unique: true
    end
  end
end
