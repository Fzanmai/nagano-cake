class Public::HomesController < ApplicationController

  def top
    @items=Item.last(4)
    @item_genres=ItemGenre.all
  end
end
