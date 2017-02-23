class CreateCsvProcessors < ActiveRecord::Migration
  def change
    create_table :csv_processors do |t|
      t.integer :status, default: 0
      t.text :error_trace
      t.integer :processed, default: 0
      t.integer :non_processed, default: 0

      t.timestamps null: false
    end
  end
end
