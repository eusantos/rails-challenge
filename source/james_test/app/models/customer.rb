class Customer < ApplicationRecord
    has_many :chagers, dependent: :destroy
end
