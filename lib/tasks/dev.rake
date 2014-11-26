task fake_many: :environment do

  1000.times do |i|
    if i % 3 == 0
      gender = 'female'
    elsif i % 3 == 1
      gender = 'male'
    else
      gender = ''
    end

    InterestedPerson.create!( name: "name #{i}" , gender: gender, email: "#{i}@#{i}.com")
  end
end