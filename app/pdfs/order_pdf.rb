class OrderPdf < Prawn::Document
	def initialize(details, view)
	    super(top_margin: 70)
	    @details = details
	    @view = view
	    text "SREE LPG (P) LTD.,", align: :center, size: 20
	    move_down 10
	    text "Employee code/Name :  Ramesh HR", align: :left, size: 15
	    move_down 2
	    text "Date: #{Time.now.strftime("%d/%m/%Y")}", align: :right, size: 15
	    move_down 4
	    text "1. Channel Partner Enquiry", align: :left, size: 15
	    line_items
	end

	
	def details(detail)
	  	"Date: #{detail.date.strftime("%d/%m/%Y")} Shop name: #{detail.shop_name}, Customer/Shop owner name: #{detail.cust_name}, Contact/Phone Number: #{detail.phone}, Address: #{detail.address}"
	end
	  

	def line_items
		main_headers = [ ["Sl.No.", "Details", "Status"]]

		table(main_headers, :header => true, :column_widths => [100, 200, 240])
				
		count = 1
		
		@details.each do |detail|
			data = []
			data << ["#{count}", "#{details(detail)}", "#{detail.status}"]
			table(data, :column_widths => [100, 200, 240])
			count = count + 1
		end
	end

end