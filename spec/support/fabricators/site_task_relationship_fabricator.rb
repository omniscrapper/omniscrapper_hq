Fabricator(:site_task_relationship) do
  site_id { Fabricate(:site).id }
  scraping_task_id { Fabricate(:scraping_task).id }
end