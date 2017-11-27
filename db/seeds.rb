# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_user = User.create( email: 'admin@usus.com', password: '12345678', username: "admin")
admin_user.add_role :admin
User.create( email: '90010000@usus.com', password: '900100001200', username: "서울과학기술대학교 총학생회", univ_id: 1)
User.create( email: '90010100@usus.com', password: '900101001200', username: "서울과학기술대학교 공과대학 학생회", univ_id: 1, college_id: 1)
User.create( email: '90010101@usus.com', password: '900101011200', username: "서울과학기술대학교 기계시스템디자인학과 학생회", univ_id: 1, college_id: 1, major_id: 1)
User.create( email: '90020000@usus.com', password: '900200001200', username: "서울여자대학교 총학생회", univ_id: 2)