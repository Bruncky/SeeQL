class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    unless params[:comment_proxy][:column_id]
      @table = Table.find(params[:comment_proxy][:table_id])
      @comment.commentable = @table
      if @comment.save
      respond_to do |format|
        format.html { redirect_to database_path(@table.database) }
        format.js {
          @data_set = params[:comment_proxy][:data_comment]
        }
        end
      else
        respond_to do |format|
        format.html { render 'tables/index' }
        format.js
        end
      end
    else
      @column = Column.find(params[:comment_proxy][:column_id])
      @comment.commentable = @column
      if @comment.save
      respond_to do |format|
        format.html { redirect_to database_path(@table.database) }
        format.js  { @data_set = params[:comment_proxy][:data_comment] }
        end
      else
      respond_to do |format|
        format.html { render 'tables/index' }
        format.js
        end
      end
    end

  end

  private

  def comment_params
    params.require(:comment_proxy).permit(:content)
  end
end