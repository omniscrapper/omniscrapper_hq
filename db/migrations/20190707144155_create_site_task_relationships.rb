Hanami::Model.migration do
  change do
    create_table :site_task_relationships do
      primary_key :id
      foreign_key :site_id, :sites, on_delete: :cascade, null: false
      foreign_key :scraping_task_id, :scraping_tasks, on_delete: :cascade, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
