Hanami::Model.migration do
  change do
    alter_table :scrapping_finished_events do
      rename_column :exception, :exception_class
    end
  end
end
