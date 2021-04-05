FactoryBot.define do
  factory :menu do
    main_name    { 'ハンバーグ' }
    main_recipe  { '料理方法' }
    main_genre   { '洋食' }
    salad_name   { 'コールスロー' }
    salad_recipe { '調理方法' }
    salad_genre  { '洋食' }
    soup_name    { 'コーンスープ' }
    soup_recipe  { '作り方' }
    soup_genre   { '和食' }
    association :user
  end
end
