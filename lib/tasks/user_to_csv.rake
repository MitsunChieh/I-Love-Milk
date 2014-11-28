# usage:
# rake csv:users:all => export all users to ./user.csv
# rake csv:users:range start=1757 offset=1957 => export users whose id are between 1757 and 1957
# rake csv:users:last number=3   => export last 3 users
require 'csv'
namespace :csv do
  namespace :users do
    desc "export all users to a csv file"
    task :all => :environment do
      export_to_csv InterestedPerson.all
    end

    desc "export users whose id are within a range to a csv file"
    task :range => :environment do |task, args|
      export_to_csv InterestedPerson.where("id >= ? and id < ?", ENV['start'], ENV['offset'])
    end

    desc "export last #number users to a csv file"
    task :last => :environment do |task, arg|
      export_to_csv InterestedPerson.last(ENV['number'].to_i)
    end

    def export_to_csv(users)
      CSV.open("./local-db/user.csv", "wb") do |csv|
        csv << InterestedPerson.attribute_names
        users.each do |user|
          csv << user.attributes.values
        end
      end
    end
  end
end