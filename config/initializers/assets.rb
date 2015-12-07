# Be sure to restart your server when you modify this file.
require 'date'
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( login.css )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#
t1 = Thread.new do
  while 0<1
     Rails.logger.debug "In Thread"
    current_time = DateTime.now
    @InterviewRecords=Interviewrecord.all
     @InterviewRecords.each do |record|
     interviewRecordValues = record.InterviewDate.split("/")
     month=interviewRecordValues [0];day= interviewRecordValues [1]; year= interviewRecordValues [2];
     if (day.to_i+1) <10
       day=(day.to_i).to_s;
      end
    #     Rails.logger.debug day
    Rails.logger.debug record.id
     if (year.to_i < current_time.year.to_i) or  (year.to_i == current_time.year.to_i and month.to_i < current_time.month.to_i ) or (year.to_i == current_time.year.to_i and month.to_i == current_time.month.to_i and day.to_i <current_time.day.to_i )#delete a previous interview entry
         Rails.logger.debug "deleting pervious recorded"
        # @InterviewRecord=InterviewRecord.find_by_id(record.id)
    #      Rails.logger.debug @InterviewRecord.ApplicantId
        # @InterviewRecord.destroy
        record.destroy
     else
        if month== current_time.month.to_s and day == (current_time.day+1).to_s and year = current_time.year.to_s
        Rails.logger.debug "Interview Scheduled for Tomorrow"
          if (record.SentReminderEmails=="false")
          @adminmailer=UserMailer.reminder_email("velpulaakshaypaul@gmail.com","Akshay","Tomorrow","5 pm","6 pm").deliver
         record.update(SentReminderEmails: "true")    
        end
      end
     end
     end
  sleep (6);
end
end
