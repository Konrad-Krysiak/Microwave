class CreateOvens < ActiveRecord::Migration
  def change
    create_table :ovens do |t|
      t.boolean :state
      t.time :time
      t.integer :power

      t.timestamps null: false
    end
  end
end
