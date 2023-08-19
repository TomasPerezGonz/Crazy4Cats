class ReactionsController < ApplicationController
    def new_user_reaction
      @user = current_user
      @article = Article.find(params[:article_id]) if params[:article_id]
      @comment = Comment.find(params[:comment_id]) if params[:comment_id]
      @kind = params[:kind]
      @reaction = Reaction.new(user: @user, article: @article, kind: @kind)
  
      if @reaction.save
        redirect_to article_path(@article), notice: 'Reaction was successfully created.'
      else
        redirect_to article_path(@article), alert: 'Something went wrong.'
      end
    end
  end
  