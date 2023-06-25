class WellcomeMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # byebug
    Rails.logger.info '=======================Job started================'
    users = User.where(status: nil)
    users.each do |u|
      Rails.logger.info "=======================#{u.id}================"
      if u.present?
        # byebug
        UserMailer.welcome_email(u).deliver_now
        u.update_column(:status, true)
        u.save
      end
      Rails.logger.info "=======================Failed: #{u.errors.inspect}================"
    end
    Rails.logger.info '=======================Job completed================'
  end
end 