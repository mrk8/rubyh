# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_tasks(title, desc, status) 
	Task.find_or_create_by(title: title)
end

seed_tasks("Task 1", "desc", 0)
seed_tasks("Task 2", "desc", 0)
seed_tasks("Task 3", "desc", 0)
seed_tasks("Task 4", "desc", 0)
seed_tasks("Task 5", "desc", 0)
seed_tasks("Task 6", "desc", 0)
seed_tasks("Task 7", "desc", 0)