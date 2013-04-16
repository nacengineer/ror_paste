FactoryGirl.define do

  factory :paste do
    title Forgery::LoremIpsum.words(5)
    paste Forgery::LoremIpsum.words(100)
    expire { 1.week.from_now }
  end

  factory :old_paste, class: Paste do
    title Forgery::LoremIpsum.words(5)
    paste Forgery::LoremIpsum.words(100)
    expire { 2.weeks.ago }
  end

end
