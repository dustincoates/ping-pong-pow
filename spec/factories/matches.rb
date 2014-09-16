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

    factory :old_match do
      after(:build) { |match| 
        match.created_at = 3.weeks.ago
      }
    end

    factory :recent_match do
      after(:build) { |match| 
        match.created_at = 1.day.ago
      }
    end
  end
end
