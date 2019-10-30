Hanami::Model.migration do
  change do
    alter_table :tasks do
      rename_column :fields, :scrapper_params
      rename_column :crawler_options, :crawler_params
    end
  end
end
