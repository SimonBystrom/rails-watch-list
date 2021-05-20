class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    # adds a movie to the current list
    @list = List.find(params[:id])
    @bookmark = Bookmark.new(bookmark_params)
    # adds the list ID to the bookmark, creating the join table relationship
    @bookmark.list = @list
    if @bookmark.save
      redirect_to :list
    else
      render :new_bookmark
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie)
  end
end
