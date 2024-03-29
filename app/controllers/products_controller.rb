class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.order("name").page(params[:page]).per(5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def search_results
    keywords = params[:keywords]
    @products = Product.where("name LIKE '%#{keywords}%'")
    if @products.empty?
      @safety = "No products found."
    else
      @safety = ""
    end
    respond_to do |format|
    format.html # search_results.html.erb
    format.json { render json: @products }
    end
  end

  def sales
    @products = Product.where(:on_sale => true)
    respond_to do |format|
      format.html # sales.html.erb
      format.json { render json: @products }
    end
  end

  def recently_updated
    @products = Product.order("updated_at").reverse
    respond_to do |format|
      format.html # newest.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
