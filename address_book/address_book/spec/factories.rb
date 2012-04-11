FactoryGirl.define do

  factory :user do
    first_name "Joe"
    last_name "Tester"

  end

  factory :address do
    city "Bend"
    state "OR"
    zip "97701"
    street "550 NW Franklin"
    user
  end



end