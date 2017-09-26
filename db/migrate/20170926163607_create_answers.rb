class CreateAnswers < ActiveRecord::Migration[5.1]
    def change
      create_table(:answers) do |t|
        t.column(:answer, :string)
        t.column(:question_id, :int)
        t.column(:a, :string)
        t.column(:b, :string)
        t.column(:c, :string)
        t.timestamps()
      end
  end
end
