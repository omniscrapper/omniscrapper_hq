# frozen_string_literal: true

Hanami::Model.migration do
  change do
    alter_table :schemas do
      add_column :name, String, null: false, unique: true
    end
  end
end
