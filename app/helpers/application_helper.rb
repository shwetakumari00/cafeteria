module ApplicationHelper
	def class_selector(params)
		if params[:controller] == 'menu' && params[:action] ==  'index'
			return "menu-img"
		elsif params[:controller] == 'pages' && params[:action] ==  'home'
			return 'home-img'
		elsif params[:controller] == 'pages' && params[:action] == 'info'
			return 'info-img'
		end
	end


	def current_order
		#Use find by id  to  avoid  potential errors 
		if  Order.find_by_id(session[:order_id]).nil?
			Order.new
		else
			Order.find_by_id(session[:order_id])


		end 
		 end 
end
