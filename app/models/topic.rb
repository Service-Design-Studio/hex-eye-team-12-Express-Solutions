class Topic < ActiveRecord::Base
    def self.topics
        topics = []
        Topic.select(:topic).each do |topic|
            topics.append(topic)
        end
        return topics
    end
end