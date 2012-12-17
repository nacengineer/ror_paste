FactoryGirl.define do
  factory :paste do
    title "This is a title"
    paste "Durka durka durka"
    expire { 1.week.from_now }
  end
end
