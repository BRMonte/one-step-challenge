FactoryBot.define do
  factory :board do
    name { "Board #{('A'..'Z').to_a.sample(2).join}" }
    email { "email#{rand(1..100)}@gmail.com" }
    height { rand(2..10) }
    width { rand(2..10) }
    mines_number { rand(0..(height * width)) }
  end
end
