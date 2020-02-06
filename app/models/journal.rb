class Journal < ApplicationRecord
    validates :title, presence: true, uniqueness: {:scope => [:user_id]}
    belongs_to :user
    
    has_many :entries, dependent: :destroy
    has_many :moods, :through => :entries
    accepts_nested_attributes_for :entries
end
