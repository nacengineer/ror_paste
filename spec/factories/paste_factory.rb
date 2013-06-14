FactoryGirl.define do

  factory :paste do
    title  {Forgery::LoremIpsum.words(5)}
    paste  {Forgery::LoremIpsum.words(100)}
    expire { 1.week.from_now }
    trait :old do
      expire {(eval(RorPaste::SETTINGS[:expire_period].to_s) + 1.day).ago}
    end

    factory :old_paste, traits: [:old]
  end

end
