class CreateMoodEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :mood_entries do |t|
      t.integer :entry_id
      t.integer :mood_id

      t.timestamps
    end
  end
end
