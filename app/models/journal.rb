class Journal < ApplicationRecord
    validates :title, presence: true

    belongs_to :user
    
    has_many :entries
    has_many :moods, :through => :entries
    accepts_nested_attributes_for :entries
end
