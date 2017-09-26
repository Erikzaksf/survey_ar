class AddValueToAnswers < ActiveRecord::Migration[5.1]
  def change
    change_table(:answers) do |t|
      t.column(:a, :string)
      t.column(:b, :string)
      t.column(:c, :string)
    end
  end
end
