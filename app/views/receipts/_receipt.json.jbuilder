json.extract! receipt, :id, :categroy, :pay_date, :amount, :content, :detail_content, :extra, :bill, :user_id, :card_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
