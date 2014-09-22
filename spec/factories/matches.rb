FactoryGirl.define do
  factory :match do
    status 'completed'
    after(:build) { |match| 
      2.times do
        match.users << create(:user)
      end
    }

    factory :match_with_winner do
      after(:create) { |match|
        match.winner_id = match.users.first.id
      }
    end
  end
end
