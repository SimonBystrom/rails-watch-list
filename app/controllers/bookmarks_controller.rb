class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:id])
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
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to :list
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
