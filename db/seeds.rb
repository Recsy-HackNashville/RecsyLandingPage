# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
one = SectionType.create(name: "Home")
two = SectionType.create(name: "Experience")
thr = SectionType.create(name: "Projects")
fou = SectionType.create(name: "Contact")
fiv = SectionType.create(name: "Education")

SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'name')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Phone Number')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'email')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Tagline 1')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Tagline 2')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Tagline 3')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'LinkedIn URL')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Github URL')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Blog URL')

SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Job Title')
SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Company')
SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Start Date')
SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'End Date')
SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Description')

SectionField.create(section_type_id: thr.id, field_table_name: 'text', label: 'Name')
SectionField.create(section_type_id: thr.id, field_table_name: 'text', label: 'URL')
SectionField.create(section_type_id: thr.id, field_table_name: 'text', label: 'Description')

SectionField.create(section_type_id: fou.id, field_table_name: 'text', label: 'Email')
SectionField.create(section_type_id: fou.id, field_table_name: 'text', label: 'Phone Number')
SectionField.create(section_type_id: fou.id, field_table_name: 'text', label: 'LinkedIn URL')
SectionField.create(section_type_id: fou.id, field_table_name: 'text', label: 'Blog URL')#21


SectionField.create(section_type_id: fiv.id, field_table_name: 'text', label: 'School Name')#22
SectionField.create(section_type_id: fiv.id, field_table_name: 'text', label: 'Degree')#23
SectionField.create(section_type_id: fiv.id, field_table_name: 'text', label: 'Field of Study')#24
SectionField.create(section_type_id: fiv.id, field_table_name: 'text', label: 'Start Date')#25
SectionField.create(section_type_id: fiv.id, field_table_name: 'text', label: 'End Date')#26
SectionField.create(section_type_id: fiv.id, field_table_name: 'text', label: 'Extra')#27
SectionField.create(section_type_id: fiv.id, field_table_name: 'text', label: 'Extra')#28
SectionField.create(section_type_id: fiv.id, field_table_name: 'text', label: 'Extra')#29

SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Logo URL')#30



