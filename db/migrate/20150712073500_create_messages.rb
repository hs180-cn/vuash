class CreateMessages < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :messages, id: :uuid do |t|
      t.binary :data, null: false, limit: 16.kilobytes + 32
      t.timestamps null: false
    end
  end
end
