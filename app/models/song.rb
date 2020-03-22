class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true

    validate :duplicate_title
    validate :year_check

    def duplicate_title
        if release_year then
            match = Song.where(artist_name: artist_name, release_year: release_year)
            if match.length > 0 && match[0] && match[0].id != id then
                errors.add(:title, "Cannot release same title in same year")
            end
        end
    end

    def year_check
        if released && (!release_year || release_year > Date.current.year) then
            errors.add(:release_year, "Must have valid release year")
        end
    end
end
