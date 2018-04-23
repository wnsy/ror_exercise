class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_business!
  require 'open-uri'

  # GET /prices
  # GET /prices.json
  def index
    @prices = Price.all

    encoded_url = URI.encode("https://api.iextrading.com/1.0/stock/#{params[:id]}/price")
    if params[:id] == ''
      @empty = 'Must enter a symbol.'
    elsif
      if params[:id]
        begin
          @price = parse_uri(open(URI.parse(encoded_url)).read)
        rescue StandardError
          @error = "The stock symbol doesn't exist."
        end
      end
    end

  end

  # GET /prices/1
  # GET /prices/1.json
  def show
  end

  # GET /prices/new
  def new
    @price = Price.new
    @stock = Stock.new
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  # POST /prices.json
  def create
    @stock = Stock.find(params[:id])
    @price = @stock.prices.create(price_params)
    @price = Price.new(price_params)

    price = open("https://api.iextrading.com/1.0/stock/#{price_params[:ticker]}/price").read
    @price = Price.new(price_params.merge({ticker: price}))

    respond_to do |format|
      if @price.save
        format.html { redirect_to @price, notice: 'Price was successfully created.' }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :new }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html { redirect_to @price, notice: 'Price was successfully updated.' }
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :edit }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price.destroy
    respond_to do |format|
      format.html { redirect_to prices_url, notice: 'Price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @price = Price.find_by(id: params[:id])
    redirect_to stocks_path, notice: 'You are not authorised to view/edit this page.' if @price.nil?
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_price
    @price = Price.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def price_params
    params.require(:price).permit(:id, :price)
  end
end
