class Api::QuotesController < ApplicationController

  def featured
    @posts = Post.all
    @quote = @posts.sample(1)
    render "show.json.jb"
  end
end

