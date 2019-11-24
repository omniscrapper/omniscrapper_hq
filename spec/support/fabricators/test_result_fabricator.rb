Fabricator(:test_result) do
  task_id { Fabricate(:task).id }

  data { Hash[data: Faker::Lorem.sentence] }
  scrapper_name { Faker::DcComics.name }
  uri { Faker::Internet.url }
end
