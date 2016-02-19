# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_tasks(title, desc, status) 
	Task.find_or_create_by(title: title, status: status)
end

seed_tasks("Task 1111", "desc", 1)
seed_tasks("Task 2222", "desc", 1)
seed_tasks("Task 3332", "desc", 1)
seed_tasks("Task 4322", "desc", 1)
seed_tasks("Task 123221", "desc", 1)
seed_tasks("Task 3122", "desc", 1)
seed_tasks("Task 122", "desc", 1)