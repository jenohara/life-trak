class Entry < ApplicationRecord
    belongs_to :journal
    belongs_to :user
    
    has_many :entry_moods
    has_many :moods, through: :entry_moods
   
end
