class Entry < ApplicationRecord
    belongs_to :journal
    has_many :mood_entries
    has_many :moods: :through => :mood_entries
end
