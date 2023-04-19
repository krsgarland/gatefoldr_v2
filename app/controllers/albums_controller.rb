class AlbumsController < ApplicationController
    before_action :set_album, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show]
    before_action :require_same_user, only: [:destroy]
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
        @album = helpers.current_user.albums.new(album_params)

    if @album.save
        flash[:notice] = "Album successfully saved!"
        redirect_to @album

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

    def require_same_user
        if helpers.current_user != @album.user
            flash[:notice] = "Unauthorized!"
            redirect_to helpers.current_user
        end
    end

    def set_album
        @album = Album.find(params[:id])
    end

    def album_params
        params.require(:album).permit(:title, :artist, :release_year, :image_path, category_ids: [])
    end

    def set_album
        @album = Album.find(params[:id])
        puts "hi"
    end
end


