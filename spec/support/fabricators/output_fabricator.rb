Fabricator(:output) do
  adapter { Faker::DcComics.hero }
  adapter_params { { name: Faker::DcComics.name } }
end
