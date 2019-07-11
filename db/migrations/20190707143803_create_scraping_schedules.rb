Hanami::Model.migration do
  change do
    create_table :scraping_schedules do
      primary_key :id
      column :time, Time, null: false
      column :interval, Integer, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
