class Detail < ApplicationRecord

	# def self.to_csv(options = {})
	#   CSV.generate(options) do |csv|
	#     csv << column_names
	#     all.each do |product|
	#       csv << product.attributes.values_at(*column_names)
	#       binding.pry
	#     end
	#   end
	# end

	def self.to_csv(options = {})
		CSV.open("#{Rails.root}/lib/attachments/file.csv", "wb") do |csv|
			# csv << column_names
			csv << "SREE LPG (P) LTD"
			csv << "Employee code/Name :  Ramesh HR"
			csv << "1. Channel Partner Enquiry"
			csv << "Date #{Time.now.strftime("%d/%m/%Y")}"
			csv << ["Sl.No.", "Details", "Status"]
			
		    all.each do |product|
		    	
		    	shop_name = product[:shop_name]
		    	cust_name = product[:cust_name]
		    	phone = product[:phone]
		    	address = product[:address]
		    	details = "Shop name: #{shop_name}, Customer/Shop owner name: #{cust_name}, Contact/Phone Number: #{phone}, Address: #{address}"
		    	status = product[:status]
		    	d = product[:date].strftime("%d/%m/%Y") if !product[:date].nil?
		      # csv << product.attributes.values_at(*column_names)
		      	csv << [d, details, status]
			end
		end
	end
end
