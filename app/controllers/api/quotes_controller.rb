class Api::QuotesController < ApplicationController

  def daily
    @quote = HTTP.get("https://healthruwords.p.rapidapi.com/v1/quotes/?id=731&t=Wisdom&maxR=1&size=medium").parse
    render "show.json.jb"
  end
end

