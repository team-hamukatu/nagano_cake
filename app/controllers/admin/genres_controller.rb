class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genres = Genre.all
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end


  def edit
    
  end
  
  
  
  def update
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end
