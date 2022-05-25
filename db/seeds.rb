# This file should contain all the record creation needed to  the database with its default values.
# The data can then be loaded with the bin/rails db: command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'pry-byebug'

puts "Destroing previous seeds..."
BasicMonthlyPayment.all.destroy_all
Lot.all.destroy_all
DwellingValuation.all.destroy_all
ReCompanyDwelling.all.destroy_all

ReCompany.all.destroy_all

EscalationValue.all.destroy_all
Building.all.destroy_all
Dwelling.all.destroy_all

Stakeholder.all.destroy_all

puts "Seeding escalation_values..."

i = 0
value = 100.to_f
year = 2022
while i < 40

  name = "IRL"
  if -i % 4 + 1 == 4
    year -= 1
  end

  period = "T#{-i % 4 + 1} #{year}"
  value = value * (1 + rand(-1..3).to_f/100)
  value = value.round(2)

  escalation_value = EscalationValue.create!(
                            name: name,
                            period: period,
                            value: value)

  i += 1
end

puts "Seeding buildings..."

i = 0
while i < 10

  address_street_number =     rand(200)
  address_street =            Faker::Address.street_name
  address_city =              Faker::Address.city
  address_zipcode =           Faker::Address.zip_code
  address_country =           Faker::Address.country

  building = Building.create!( address_street_number: address_street_number,
                              address_street: address_street,
                              address_city: address_city,
                              address_zipcode: address_zipcode,
                              address_country: address_country)

  i += 1
end

puts "Seeding dwellings..."

i = 0
while i < 10

  name = Faker::Address.secondary_address

  dwelling = Dwelling.create!(name: name)

  i += 1
end


puts "Seeding lots..."

i = 0
while i < 20

  lot_number =                Faker::Address.building_number
  lot_designation =           Faker::Address.mail_box
  lot_location_in_building =  Faker::Address.building_number
  building =                  Building.all.sample
  dwelling =                  Dwelling.all.sample

  lot = Lot.create!(           lot_number: lot_number,
                              lot_designation: address_street,
                              lot_location_in_building: lot_location_in_building,
                              building: building,
                              dwelling: dwelling)

  i += 1
end

#Removing all buildings that have no lots"
puts "cleaning buildings..."

Building.all.each do |building|
  selected_lots = Lot.all.select { |lot| lot.building == building }
#  binding.pry
  if selected_lots == []
#    binding.pry
    building.delete
  end
end

#Removing all dwellings that have no lots"
puts "cleaning dwellings..."

Dwelling.all.each do |dwelling|
  selected_lots = Lot.all.select { |lot| lot.dwelling == dwelling }

  if selected_lots != []
    primary_lot_in_selected_lots = selected_lots.sample
    primary_lot_in_selected_lots.primary_lot = true
    primary_lot_in_selected_lots.surface = rand(2500..15000)/100.to_f.round(2)
    primary_lot_in_selected_lots.save

    selected_lots.each do |lot|
      if lot != primary_lot_in_selected_lots
        lot.primary_lot = false
        lot.surface = 0
        lot.save
      end
    end

  else
    dwelling.delete
  end
end

puts "Seeding basic_monthly_payments..."

Dwelling.all.each do |dwelling|
  selected_lots = Lot.all.select { |lot| lot.dwelling == dwelling }

  surface = selected_lots.reduce(0) do |tot_surface, lot|
    tot_surface += lot.surface
  end

  rent = (20 + rand(-1000..1000).to_f/100).round(2)
  amount = surface * rent

  escalation_value = EscalationValue.all.sample

  BasicMonthlyPayment.create!( amount: amount,
                              dwelling: dwelling,
                              escalation_value: escalation_value)
end

puts "Seeding dwelling_valuation..."

Dwelling.all.each do |dwelling|
  selected_lots = Lot.all.select { |lot| lot.dwelling == dwelling }

  surface = selected_lots.reduce(0) do |tot_surface, lot|
    tot_surface += lot.surface
  end

  i = rand(3)
  while i < 3 do

    price_per_sqm = rand(3000..8000)
    amount = surface * price_per_sqm

    valuer =                  Faker::GreekPhilosophers.name
    method =                  "Automatic"
    date =                    Faker::Date.between(from: 200.days.ago, to: Date.today)

    DwellingValuation.create!( valuer: valuer,
                              method: method,
                              date: date,
                              amount: amount,
                              dwelling: dwelling)
    i += 1
  end
end

puts "Seeding re_companies and re_company_dwelling..."

Dwelling.all.each do |dwelling|

  name =                    "#{dwelling.name} SCI"
  rcs_number =              Faker::Company.french_siren_number
  registry_city =           "Paris"
  equity =                  rand(1000..10000)
  min_capital =             1000
  max_capital =             10000
  director =                "Acqer SAS"

  ReCompany.create!(         name: name,
                            rcs_number: rcs_number,
                            registry_city: registry_city,
                            equity: equity,
                            min_capital: min_capital,
                            max_capital: max_capital,
                            director: director)
  re_company = ReCompany.last

  ReCompanyDwelling.create!( dwelling: dwelling,
                            re_company: re_company)

end

puts "Seeding stakeholders-Institutional investors..."

i = 0
while i < 4

  category =                "Institutional Investor"

  bank_iban =               Faker::Bank.iban
  telephone_number =        Faker::PhoneNumber.phone_number
  email =                   Faker::Internet.email

  address_street_number =   rand(200)
  address_street =          Faker::Address.street_name
  address_city =            Faker::Address.city
  address_zipcode =         Faker::Address.zip_code
  address_country =         Faker::Address.country

  company_name =            Faker::Company.name
  company_rcs_number =      Faker::Company.french_siren_number
  company_registry_city =           address_city
  company_equity =          rand(1000..10000)
  company_director =        Faker::Company.name


  Stakeholder.create!(       category: category,
                            bank_iban: bank_iban,
                            telephone_number: telephone_number,
                            email: email,
                            address_street_number: address_street_number,
                            address_street: address_street,
                            address_city: address_city,
                            address_zipcode: address_zipcode,
                            address_country: address_country,
                            company_name: company_name,
                            company_rcs_number: company_rcs_number,
                            company_registry_city: company_registry_city,
                            company_equity: company_equity,
                            company_director: company_director)

  i += 1

end

  binding.pry
