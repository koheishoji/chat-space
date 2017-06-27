FactoryGirl.define do

  factory :message do
    body        Faker::Lorem.sentence
    image       File.open(File.join(Rails.root, '/spec/files/test.jpg'))
    group_id    Faker::Number.number(1)
    user_id     Faker::Number.number(1)
    created_at  Faker::Time.between(2.days.ago, Date.today, :all)

  end

end
