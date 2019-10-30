Hanami::Model.migration do
  change do
    drop_table :scraping_tasks
  end
end
