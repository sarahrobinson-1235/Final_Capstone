class Api::QuotesController < ApplicationController

  def daily
    @quote = HTTP.get("https://zenquotes.io/api/random").parse["body"]
    render "show.json.jb"
  end
end
