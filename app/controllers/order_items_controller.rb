class OrderItemsController < ApplicationController
	before_action :set_order
  def create
    @order_item = @order.order_items.new(order_params)
  	@order.save
  	session[:order_id] = @order.id
  	redirect_to  "/cart"
  end
  

  def update
  	
  	@order_item = @order.order_items.find(params[:id])
  	@order_item.update(order_params)
  	order_items = current_order.order_items
  	redirect_to order_item_path(@order_item)
  end
  
  def destroy
  	@order_item = @order.order_items.find(params[:id])
  	@order_item.destroy
    @order_items = current_order.order_items
    redirect_to "/cart"
  end

  def show
   	@order_items = OrderItem.all
  	@order_item = @order.order_items.find(params[:id])	
  end

 private 
  def order_params
  	params.require(:order_item).permit(:product_id, :quantity)
  end

  def set_order
	@order  = current_order
  end 
end
