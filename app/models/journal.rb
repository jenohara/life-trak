class Journal < ApplicationRecord
    validates :title, presence: true

    belongs_to :user
    
    has_many :entries
end
