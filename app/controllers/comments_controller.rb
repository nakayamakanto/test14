class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment=current_user.comments.build(comment_params)
    #saveまえなので、@picture=@comment.picture だと気持ち悪い。
    @picture=Picture.find(comment_params[:picture_id])

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to picture_url(@picture), notice: 'コメントを投稿しました' }

        # format.json { render :show, status: :created, location: @comment}
        # Ajaxでは、requestの最後に.jsがつくから、うごくのはこれ！
        format.js {render :index}
      else
        format.html { redirect_to picture_url(@picture), notice: 'コメントを投稿できませんでした' }

        # format.json { render :show, status: :created, location: @comment}
        format.js {render :index}
      end
    end
  end

  def destroy
    #よくわからないが、picture_comment_pathでpictureインスタンスを入れているが、paramsに入っているのはpicture_idだけ。仕方ないので、@pictureを作る。
    @picture=Picture.find(params[:picture_id])
    respond_to do |format|
      if @comment.destroy
          format.html {redirect_to picture_url(@picture), notice: 'コメントを削除しました'}
      else
          format.html {redirect_to picture_url(@picture), notice: 'コメントを削除できませんでした'}
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:picture_id, :content)
  end

  #before_actionでコメントを取ってきてしまう
  def set_comment
    @comment=Comment.find(params[:id])
  end
end
