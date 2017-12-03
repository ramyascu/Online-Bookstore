# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Product.create!(name: 'Programming Ruby 1.9 & 2.0',
  description:
  %{<p>
    Ruby is the fastest growing and most exciting dynamic language
    out there. If you need to get working programs delivered fast,
    you should add Ruby to your toolbox.
    </p>},
    image: 'ruby.jpg',
    price: 49.95)

Product.create!(name: 'Thermodynamics: An Engineering Approach',   
    description:     
    %{<p>
        SmartBook is the first and only adaptive reading experience designed to change the way students read
        and learn. It creates a personalized reading experience by highlighting the most impactful concepts
        a student needs to learn at that moment in time. As a student engages with SmartBook, the reading
        experience continuously adapts by highlighting content based on what the student knows and doesn’t
        know. This ensures that the focus is on the content he or she needs to learn, while simultaneously
        promoting long-term retention of material. Use SmartBook’s real-time reports to quickly identify the
        concepts that require more attention from individual students–or the entire class.
    </p>},
    image: 'thermo.jpg',   
    price: 115.95)

Product.create!(name: 'Essentials of Investments',   
    description:     
    %{<p>
        LearnSmart is an intelligent learning system that uses a series of adaptive questions to pinpoint
        each student's knowledge gaps. LearnSmart then provides an optimal learning path for each student,
        so that they spend less time in areas they already know and more time in areas they don't.
    </p>},   
    image: 'investment.jpg',   
    price: 35.00)

Product.create!(name: 'Ruby on Rails Tutorial: Learn Web Development with Rails (4th Edition)',
    description:
    %{<p>  
        This indispensable guide provides integrated tutorials not only for
        Rails, but also for the essential Ruby, HTML, CSS, and SQL skills you need when developing web
        applications. Hartl explains how each new technique solves a real-world problem, and then he
        demonstrates it with bite-sized code that’s simple enough to understand, yet novel enough to be
        useful.
    </p>},   
    image: 'rails.jpg',  
    price: 55.95)

User.delete_all
User.create!(name: 'admin', password: 'admin')

