class CreateEntryMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_moods do |t|
      t.integer :entry_id
      t.integer :mood_id

      t.timestamps
    end
  end
end
