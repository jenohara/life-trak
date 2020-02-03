class AddEntryToMoods < ActiveRecord::Migration[6.0]
  def change
    add_column :moods, :entry_id, :integer
  end
end
