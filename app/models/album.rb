class Album < ApplicationRecord
    has_and_belongs_to_many :categories 
    
    validates :title, presence: true, length: {minimum: 2, maximum: 100}
    validates :artist, presence: true, length: {minimum: 2, maximum: 100}
    validates :release_year, presence: true, length: {minimum: 4, maximum: 4}

    validate :image_path_exists

    def image_path_exists
        require 'open-uri'

        begin
            path = URI.open(image_path)
            errors.add(:image_path, "does not contain image content") and return unless path.content_type.starts_with?("image")
        rescue
            errors.add(:image_path, "invalid url")
        end
    end
end
