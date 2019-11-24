Fabricator(:schema) do
  definition {
    {
      type: "object",
      properties: { a: { type: "integer"} }
    }
  }
  name { Faker::Name.name }
end
