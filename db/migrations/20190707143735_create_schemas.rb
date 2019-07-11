Hanami::Model.migration do
  change do
    create_table :schemas do
      primary_key :id

      column :metadata, "jsonb", null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
