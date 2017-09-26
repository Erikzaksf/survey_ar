class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table(:results) do |t|
      t.column(:survey_id, :int)
      t.timestamps()
    end
  end
end
