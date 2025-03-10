namespace :util do
  desc 'cleanup_profiles'
  task cleanup_profiles: :environment do
    ActiveRecord::Base.logger = Logger.new($stdout)
    Rails.logger.level = Logger::DEBUG

    abbr = ENV.fetch('EVENT_ABBR')

    ActiveRecord::Base.transaction do
      conference = Conference.find_by(abbr:)
      unless conference.archived?
        raise "#{conference.abbr} is not archived yet"
      end
      conference.profiles.each do |profile|
        AccessLog.where(profile_id: profile.id).each(&:destroy!)
        RegisteredTalk.where(profile_id: profile.id).each(&:destroy!)
        Agreement.where(profile_id: profile.id).each(&:destroy!)
        ChatMessage.where(profile_id: profile.id).each do |chat_message|
          chat_message.update!(profile_id: nil)
        end
        profile.destroy!
      end
    end
  end
end
