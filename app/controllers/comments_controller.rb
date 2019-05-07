class CommentsController < ApplicationController
  before_action :move_to_index, except: [:index,:show]

  def index
    @comments = Comment.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    @comments = Comment.where(user_id: current_user.id).includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(title: comment_params[:title], text: comment_params[:text], user_id: current_user.id)
    if @comment.save
      redirect_to "/comments/:id", notice: 'コメントを作成しました'
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path, notice: 'コメントを編集しました'
    else
      @comment = Comment.find(params[:id])
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to action: :show
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
