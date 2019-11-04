Hanami::Model.migration do
  change do
    alter_table :tasks do
      add_foreign_key :output_id, :outputs, on_delete: :restrict, null: false
    end
  end
end
