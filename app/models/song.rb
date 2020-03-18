class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {
        scope: %i[release_year artist_name],
        message: "Title must be unique across same artist and year"
    }

    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true

    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}, if: :released?

    def released?
        released
    end




end
