Fabricator(:schema) do
  metadata  { { type: "object", properties: { a: { type: "integer"} } } }
end