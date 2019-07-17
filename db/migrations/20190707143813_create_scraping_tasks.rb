Hanami::Model.migration do
  change do
    create_table :scraping_tasks do
      primary_key :id
      foreign_key :schema_id, :schemas, on_delete: :cascade, null: false
      foreign_key :scraping_schedule_id, :scraping_schedules, on_delete: :cascade, null: false

      column :name, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
