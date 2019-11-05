Fabricator(:task) do
  schema_id { Fabricate(:schema).id }
  site_id { Fabricate(:site).id }
  output_id { Fabricate(:output).id }

  name { Faker::Name.name }
  crawler { Faker::Name.name }
  scrapper_params { { name: Faker::Name.name } }
  crawler_params { { name: Faker::Name.name } }
end
