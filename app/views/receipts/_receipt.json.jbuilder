json.extract! receipt, :id, :category, :pay_date, :amount, :content, :detail_content, :extra, :bill, :user_id, :card_id, :cash, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
