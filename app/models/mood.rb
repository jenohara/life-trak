class Mood < ApplicationRecord
    has_many :mood_entries
    has_many :entries, :through => mood_entries
    has_many :users, :through => :entries

end
