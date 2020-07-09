module CommentsHelper
  
  def flag_on
    @comments. each do |flag|
      if @blacklist.user_id ==  @comment.where(user_id: @comennt.id)
        @comment.flag = false
        
      end
    end
  end

end
