class UserMailer < ApplicationMailer
  def welcome_email(applications,body,subject)
    @applicant = applications
    @body=body
# logger.debug "sending main to"
# logger.debug @applicant.email
    mail(to: @applicant.email, subject: subject )

  end
  def interviewRequest_email(applications,date,starttime,endtime,body,subject)
    logger.debug "intrequest"
    @applicant = applications
    @body=body
    mail(to: @applicant.email, subject: subject )
  end
  def admin_email(admin_email_id,applicantname,dateofInterview,starttime,endtime)
    #@user = user
    #@body=" This is the admin working emails"
    @name=applicantname
    @date=dateofInterview
    @startTime=starttime
    @endTime=endtime

    mail(to: admin_email_id, subject: "ApplicantInterviewInformation")

  end
  def reminder_email(admin_email_is, applicant_name,interviewDate, startTime,endTime)
  @name=applicant_name
  @Date=interviewDate
  @starttime=startTime
  @endtime=endTime
    mail(to: "velpulaakshaypaul@gmail.com", subject: "ReminderEmail")
  end
end
