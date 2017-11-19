class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :major_name
      t.references :college, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
