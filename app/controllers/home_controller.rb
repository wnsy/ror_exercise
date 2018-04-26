class HomeController < ApplicationController
  def index
    encoded_url = URI.encode("https://api.iextrading.com/1.0/stock/#{params[:id]}/price")
    if params[:id] == ''
      @empty = 'Must enter a symbol.'
    elsif
      if params[:id]
        begin
          @stock = parse_uri(open(URI.parse(encoded_url)).read)
        rescue StandardError
          @error = "The stock symbol doesn't exist."
        end
      end
    end
  end
end
