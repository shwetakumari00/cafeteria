class ProductsController < ApplicationController
  before_action :set_category
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = @category.products
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = @category.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = @category.products.build(product_params)
    @product.category = Category.find(params[:product][:category_id])

    respond_to do |format|
      if @product.save
        format.html { redirect_to category_products_path, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = @category.products.build(product_params)
    @product.category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to category_products_path, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
     respond_to do |format|
      format.html { redirect_to category_products_path, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def check_categories
    redirect_to new_catgory_path if Category.count == 0
  end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @category.products.find(params[:id])
    end

      def set_category
      @category = Category.find(params[:category_id])
      end 
   # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :image, :category_id, :dairy_free_boolean, :gluter_free, :kosher, :peanut_free, :vegan, :vegetarian, :available, :catering, :featured)
    end
end
