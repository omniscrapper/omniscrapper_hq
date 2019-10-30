# frozen_string_literal: true

Fabricator(:scraping_task) do
  name { 'task' }
  schema_id { Fabricate(:schema).id }
  site_id { Fabricate(:site).id }
end
