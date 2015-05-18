# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
states = [{
		name: 'Abuja'
	},{
		name: 'Abia'
	}, {
		name: 'Adamawa'
	}, {
		name: 'Akwa Ibom'
	}, {
		name: 'Anambra'
	}, {
		name: 'Bauchi'
	}, {
		name: 'Bayelsa'
	}, {
		name: 'Benue'
	}, {
		name: 'Borno'
	}, {
		name: 'Cross River'
	}, {
		name: 'Delta'
	}, {
		name: 'Ebonyi'
	}, {
		name: 'Edo'
	}, {
		name: 'Ekiti'
	}, {
		name: 'Enugu'
	}, {
		name: 'Gombe'
	}, {
		name: 'Imo'
	}, {
		name: 'Jigawa'
	}, {
		name: 'Kaduna'
	}, {
		name: 'Kano'
	}, {
		name: 'Katsina'
	}, {
		name: 'Kebbi'
	}, {
		name: 'Kogi'
	}, {
		name: 'Kwara'
	}, {
		name: 'Lagos'
	}, {
		name: 'Nasarawa'
	}, {
		name: 'Niger'
	}, {
		name: 'Ogun'
	}, {
		name: 'Ondo'
	}, {
		name: 'Osun'
	}, {
		name: 'Oyo'
	}, {
		name: 'Plateau'
	}, {
		name: 'Rivers'
	}, {
		name: 'Sokoto'
	}, {
		name: 'Taraba'
	}, {
		name: 'Yobe'
	}, {
		name: 'Zamfara'
	}
]
nation = Nation.create(name: 'Nigeria')
nation.states.create(states)

