Hanami::Model.migration do
  change do
    alter_table :outputs do
      add_column :name, String
    end
  end
end
