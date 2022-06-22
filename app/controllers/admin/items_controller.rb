class Admin::ItemsController < ApplicationController

 def new
   @item = Item.new
   @item_genres = ItemGenre.all
 end

 def index
   @item = Item.new
   @items = Item.all.page(params[:page]).per(8)
 end

 def show
   @item = Item.find(params[:id])
 end

 def create
   @item = Item.new(item_params)
    if @item.save
    redirect_to admin_items_path
    else
    render:new
    end
 end

 def edit
   @item = Item.find(params[:id])
   @item_genres = ItemGenre.all
 end

 def update
   @item = Item.find(params[:id])
   @item.update(item_params)
   redirect_to admin_item_path(@item.id)
 end

 def destroy
    @item=Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
 end

 private

 def item_params
 params.require(:item).permit(:item_image, :name, :introduction, :item_genre_id, :price, :is_active)
 end


end
