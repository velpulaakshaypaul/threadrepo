class UserMailer < ApplicationMailer
  def welcome_email(applications,body)
    @applicant = applications
    @body=body
# logger.debug "sending main to"
# logger.debug @applicant.email
    mail(to: @applicant.email, subject: @applicant.first_name )

  end
  def admin_email(admin_email_id)
    #@user = user
    @body=" This is the admin working emails"

    mail(to: admin_email_id, subject: "admin")

  end
end
