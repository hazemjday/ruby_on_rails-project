class CommentsController < ApplicationController
  def create
    @home= Home.find(params[:home_id])
    @comment = @home.comments.create(comment_params)
     flash[:notice] = "Votre commentaire a été envoyé avec succès."
     redirect_to home_path(@home)
  end     

  def destroy
    @home = Home.find(params[:home_id])
    @comment = @home.comments.find(params[:id])
    @comment.destroy
    redirect_to home_admin_path(@home), notice: 'Commentaire supprimé avec succès.'
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :phone)
    end

    
end
