class Mood < ApplicationRecord
    
    has_many :entry_moods
    has_many :entries, through: :entry_moods 
    has_many :journals, :through => :entries

    validates :mood_type, presence: true
    validates :mood_type, uniqueness: true
end
