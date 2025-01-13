class CreateDataSources < ActiveRecord::Migration[8.0]
  def change
    create_table :data_sources do |t|
      t.string :name
      t.string :integration_type
      t.json :connection_details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
