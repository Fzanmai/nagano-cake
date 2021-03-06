class Admin::ItemGenresController < ApplicationController

  def index
    @item_genre = ItemGenre.new
    @item_genres = ItemGenre.all
  end

  def edit
    @item_genre = ItemGenre.find(params[:id])
  end

  def create
    item_genre = ItemGenre.new(item_genre_params)
    item_genre.save
    redirect_to admin_item_genres_path
  end

  def update
    item_genre = ItemGenre.find(params[:id])
    item_genre.update(item_genre_params)
    redirect_to admin_item_genres_path
  end

  def destroy
    item_genre = ItemGenre.find(params[:id])
    item_genre.destroy
    redirect_to  admin_item_genres_path
  end

  private

  def item_genre_params
    params.require(:item_genre).permit(:name)
  end
end
