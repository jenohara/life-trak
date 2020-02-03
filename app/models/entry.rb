class Entry < ApplicationRecord
    belongs_to :journal
    
    has_many :moods
    accepts_nested_attributes_for :moods
end
