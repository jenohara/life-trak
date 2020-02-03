class Mood < ApplicationRecord
    
    has_many :entries
    has_many :journals, :through => :entries

    validates :mood_type, presence: true
    validates :mood_type, uniqueness: true
end
