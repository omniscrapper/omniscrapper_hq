Hanami::Model.migration do
  change do
    create_table :schemas do
      primary_key :id
      foreign_key :site_id, :sites, on_delete: :cascade, null: false
      column :url, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
