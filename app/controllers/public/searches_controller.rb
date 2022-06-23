class Public::SearchesController < ApplicationController

	def search
		@model = params[:range]
		@content = params[:word]
		@method = params[:search]
		if @model == 'Item'
			@records = Item.search_for(@content, @method)
		end
	end
end