Hanami::Model.migration do
  change do
    create_table :test_results do
      primary_key :id

      foreign_key :task_id, :tasks, on_delete: :restrict, null: false
      column :data, "jsonb", null: false
      column :scrapper_name, String, null: false
      column :checksum, String, null: true
      column :uri, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
