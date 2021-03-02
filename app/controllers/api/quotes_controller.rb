class Api::QuotesController < ApplicationController

  def daily
    @quote = HTTP.get("https://zenquotes.io/api/today").body
    render "show.json.jb"
  end
end
