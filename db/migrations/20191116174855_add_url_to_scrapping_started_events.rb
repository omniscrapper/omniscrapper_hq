Hanami::Model.migration do
  change do
    alter_table :scrapping_started_events do
      add_column :url, String, null: false
    end
  end
end
