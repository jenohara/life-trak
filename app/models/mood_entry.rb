class MoodEntry < ApplicationRecord
    belongs_to :journal
    belongs_to :mood
end
