require 'csv'
class Admin::PackagesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["email", "name", "gender"]

          InterestedPerson.find_each do |user|
            gender = ''
            if user.gender == 'female'
              gender = '小姐'
            elsif user.gender == 'male'
              gender = '先生'
            end
            csv << [user.email, user.name, gender]
          end

        end

        render :text => csv_string
      }
    end
  end

  def export

  end

end
