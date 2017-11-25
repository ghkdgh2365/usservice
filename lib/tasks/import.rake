require 'csv'
namespace :csv do
    task :univ => :environment do
        CSV.foreach('univ.csv', :headers => true , :encoding => 'euc-kr') do |row|
          Univ.create!(row.to_hash)
        end
    end
    task :college => :environment do
        CSV.foreach('college.csv', :headers => true , :encoding => 'euc-kr') do |row|
          College.create!(row.to_hash)
        end
    end
    task :major => :environment do
        CSV.foreach('major.csv', :headers => true , :encoding => 'euc-kr') do |row|
          Major.create!(row.to_hash)
        end
    end
end