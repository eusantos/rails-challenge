require 'test_helper'

class ChargesControllerTest < ActionDispatch::IntegrationTest

  test "should get correct charges" do
  	customer = create(:customer)
    create_list(:charge, 10, :paid, customer: customer)
    create_list(:charge, 5, :disputed, customer: customer)
    create_list(:charge, 5, :refunded, customer: customer)

  	get "/charges"

  	assert_response :success
    assert(assigns(:charges_paid).count == 10)
    assert(assigns(:charges_disputed).count == 5)
    assert(assigns(:charges_failed).count == 5)
  end

  FactoryBot.define do
    factory :customer do
      first_name {"John"} 
      last_name  {"Doe"}
    end
  end

  FactoryBot.define do
    factory :charge do
      amount {999999}
  
      trait :paid do
        paid {true}
      end
      
      trait :disputed do
        disputed {true}
      end
  
      trait :refunded do
        refunded {true}
      end
  
      association :customer
    end
  end
  


end
