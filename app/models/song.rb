class Song < ApplicationRecord
    #is invalid without title
    validates :title, presence: true


    #is invalid when the release year is in the future
    validates :release_year, numericality: {less_than: Time.now.year},if: :released?
    
    # is invalid if an artist tries to release the same song twice in a year
    validates :title, uniqueness: {scope: :release_year}

    
    def released?
        self.released==true
    end


end
