class Admin::ItemsController < ApplicationController

 before_action :authenticate_admin!

 def new
  @item = Item.new
 end

 def index
  @item = Item.new
 end

 def show
 end

 def create
 end

 def edit
 end

 def update
 end

 private

 def item_params
 params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
 end


end
