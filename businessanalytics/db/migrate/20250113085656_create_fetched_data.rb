class CreateFetchedData < ActiveRecord::Migration[8.0]
  def change
    create_table :fetched_data do |t|
      t.references :data_source, null: false, foreign_key: true
      t.references :dashboard, null: false, foreign_key: true
      t.json :data
      t.datetime :fetched_at

      t.timestamps
    end
  end
end
