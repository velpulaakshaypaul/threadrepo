class CreateInterviewrecords < ActiveRecord::Migration
  def change
    create_table :interviewrecords do |t|
      t.string :AdminEmails
      t.text :InterviewStartTime
      t.text :InterviewEndTime
      t.text :InterviewDate
      t.string :SentReminderEmails
      t.integer :ApplicantId

      t.timestamps null: false
    end
  end
end
