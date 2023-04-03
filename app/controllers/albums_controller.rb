class AlbumsController < ApplicationController
    before_action :set_album, only: [:show, :edit, :update, :destroy]

    #GET - Show all albums
    def index 
        @albums = Album.all
    end
    #GET - show specific album
    def show 
        
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
    #GET - edit album
    def edit

    end

    def update 

        if @album.update(album_params)
            redirect_to @album
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @album.destroy
        redirect_to albums_path
    end

    private
    def album_params
        params.require(:album).permit(:title, :artist, :release_year, :image_path)
    end

    def set_album
        @album = Album.find(params[:id])
    end
end