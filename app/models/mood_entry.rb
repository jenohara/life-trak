class MoodEntry < ApplicationRecord
    belongs_to :entry
    belongs_to :mood
end
