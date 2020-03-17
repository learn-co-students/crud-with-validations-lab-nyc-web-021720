class SongsController < ApplicationController

    before_action :find_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs=Song.all
        
    end

    def show
    end

    def new
        @song=Song.new
    end

    def create
        @song=Song.create(song_params)

        if @song.valid?
            redirect_to song_path(@song)
        else
            flash[:error]=@song.errors.full_messages
            # redirect_to new_song_path
           render :new 
        end
    end
    
    def edit
    end

    def update
       if @song.update(song_params)
            redirect_to @song
       else
        flash[:error]=@song.errors.full_messages
        # redirect_to edit_song_path(@song)
        render :edit
       end
     
    end

    def destroy
        @song=Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end

    
    private
    
    def song_params
        params.require(:song).permit(:title, :released, :genre, :artist_name, :release_year)
    end
    
    def find_song
        @song=Song.find(params[:id])
    end

end
