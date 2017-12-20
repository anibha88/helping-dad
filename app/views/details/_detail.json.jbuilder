json.extract! detail, :id, :shop_name, :cust_name, :phone, :address, :status, :created_at, :updated_at
json.url detail_url(detail, format: :json)
