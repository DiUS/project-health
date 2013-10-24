technical = Category.create(name: "Technical")
process = Category.create(name: "Process")
team = Category.create(name: "Team")

ind1 = Indicator.create(name: "Tech debt", category: technical, sort_order: 1)
ind2 = Indicator.create(name: "Morale", category: team, sort_order: 2)
ind3 = Indicator.create(name: "Enthusiasm", category: team, sort_order: 3)
ind4 = Indicator.create(name: "Management", category: process, sort_order: 4)

project1 = Project.create(name: "Project Indicator")

iteration1 = Iteration.create(project: project1, name: "Iteration1", sort_order: 1, status: 'past')
iteration2 = Iteration.create(project: project1, name: "Iteration2", sort_order: 2, status: 'current')

Rating.create(iteration: iteration1, indicator: ind1, score: 2)
Rating.create(iteration: iteration1, indicator: ind1, score: 3)
Rating.create(iteration: iteration1, indicator: ind1, score: 3)

Rating.create(iteration: iteration1, indicator: ind2, score: 3)
Rating.create(iteration: iteration1, indicator: ind2, score: 4)
Rating.create(iteration: iteration1, indicator: ind2, score: 3)

Rating.create(iteration: iteration1, indicator: ind3, score: 3)
Rating.create(iteration: iteration1, indicator: ind3, score: 2)
