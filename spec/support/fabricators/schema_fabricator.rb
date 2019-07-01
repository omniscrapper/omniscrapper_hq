Fabricator(:schema) do
  site_id { Fabricate(:site).id }
  url { "schema url" }
end