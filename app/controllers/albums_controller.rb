class AlbumsController < ApplicationController

    #GET - Show all albums
    def index 
        @albums = Album.all
    end
    #GET - Request page with form to create new album
    def new
        @album = Album.new
    end
    #POST - create an album
    def create 
        @album = Album.new(album_params)

    if @album.save
        flash[:notice] = "Album successfully saved!"
        redirect_to albums_path

    else 
        flash[:notice] = "There was an error creating an album!"
        render :new, status: :unprocessable_entity
    end
end

    private
    def album_params
        params.required(:album).permit(:title, :artist, :release_year, :image_path)
    end
end
