class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.binary :data, null: false, limit: 16.kilobytes + 32

      t.timestamps null: false
    end
  end
end
