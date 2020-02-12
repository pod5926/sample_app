class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    #(訳注: 1行のときは後置if文、2行以上のときは前置if文を使うのがRubyの慣習です。)
  end

  def help
  end

  def about
  end

  def contact
  end
end
