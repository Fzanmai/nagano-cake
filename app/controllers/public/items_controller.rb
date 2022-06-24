class Public::ItemsController < ApplicationController

	 def index
     @items = Item.all.page(params[:page]).per(8)
     @amount = Item.count
	 end

	 def show
	 @item = Item.find(params[:id])
	 @items = Item.all
	 end

end
