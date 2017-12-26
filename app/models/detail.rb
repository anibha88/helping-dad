class Detail < ApplicationRecord
	validates :shop_name, presence: true
	validates :status, presence: true
	validates_format_of :phone, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
	default_scope -> { order(updated_at: :desc)}
end
