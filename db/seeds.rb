Indicator.attr_accessible :name, :category, :sort_order
Iteration.attr_accessible :project, :name, :status, :sort_order

technical = Category.create(name: "Technical")
process = Category.create(name: "Process")
team = Category.create(name: "Team")

ind1 = Indicator.create(name: "Tech debt", category: technical, sort_order: 1)
ind2 = Indicator.create(name: "Morale", category: team, sort_order: 2)
ind3 = Indicator.create(name: "Enthusiasm", category: team, sort_order: 3)
ind4 = Indicator.create(name: "Management", category: process, sort_order: 4)
ind5 = Indicator.create(name: "Passion", category: team, sort_order: 5)
ind6 = Indicator.create(name: "Builds", category: technical, sort_order: 6)
ind7 = Indicator.create(name: "Consensus", category: team, sort_order: 7)
ind8 = Indicator.create(name: "Change", category: process, sort_order: 8)
ind9 = Indicator.create(name: "Releasabilty", category: technical, sort_order: 9)
ind10 = Indicator.create(name: "Inclusiveness", category: process, sort_order: 10)
ind11= Indicator.create(name: "Innovation", category: team, sort_order: 11)
ind12 = Indicator.create(name: "Integration", category: technical, sort_order: 12)

project1 = Project.create(name: "Project Indicator")
project2 = Project.create(name: "Another Project")

proj1_ind1 = ProjectIndicator.create(project: project1, indicator: ind1)
proj1_ind2 = ProjectIndicator.create(project: project1, indicator: ind2)
proj1_ind3 = ProjectIndicator.create(project: project1, indicator: ind3)
proj1_ind4 = ProjectIndicator.create(project: project1, indicator: ind4)
proj1_ind5 = ProjectIndicator.create(project: project1, indicator: ind5)

proj2_ind5 = ProjectIndicator.create(project: project2, indicator: ind5)
proj2_ind6 = ProjectIndicator.create(project: project2, indicator: ind6)
proj2_ind7 = ProjectIndicator.create(project: project2, indicator: ind7)
proj2_ind8 = ProjectIndicator.create(project: project2, indicator: ind8)
proj2_ind9 = ProjectIndicator.create(project: project2, indicator: ind9)
proj2_ind10 = ProjectIndicator.create(project: project2, indicator: ind10)
proj2_ind11 = ProjectIndicator.create(project: project2, indicator: ind11)
proj2_ind12 = ProjectIndicator.create(project: project2, indicator: ind12)

project1_iteration1 = Iteration.create(project: project1, name: "Iteration 1", status: Iteration::PAST, sort_order: 1)
project1_iteration2 = Iteration.create(project: project1, name: "Iteration 2", status: Iteration::CURRENT, sort_order: 2)
project2_iteration1 = Iteration.create(project: project2, name: "Iteration 1", status: Iteration::CURRENT, sort_order: 1)

Rating.create(iteration: project1_iteration1, indicator: ind1, score: 1)
Rating.create(iteration: project1_iteration1, indicator: ind1, score: 2)
Rating.create(iteration: project1_iteration1, indicator: ind1, score: 2)

Rating.create(iteration: project1_iteration1, indicator: ind2, score: 4)
Rating.create(iteration: project1_iteration1, indicator: ind2, score: 2)
Rating.create(iteration: project1_iteration1, indicator: ind2, score: 1)

Rating.create(iteration: project1_iteration1, indicator: ind3, score: 2)
Rating.create(iteration: project1_iteration1, indicator: ind3, score: 3)


Rating.create(iteration: project1_iteration2, indicator: ind1, score: 1)
Rating.create(iteration: project1_iteration2, indicator: ind1, score: 2)
Rating.create(iteration: project1_iteration2, indicator: ind1, score: 1)
Rating.create(iteration: project1_iteration2, indicator: ind1, score: 1)

Rating.create(iteration: project1_iteration2, indicator: ind2, score: 2)
Rating.create(iteration: project1_iteration2, indicator: ind2, score: 2)
Rating.create(iteration: project1_iteration2, indicator: ind2, score: 3)
Rating.create(iteration: project1_iteration2, indicator: ind2, score: 2)

Rating.create(iteration: project1_iteration2, indicator: ind3, score: 3)
Rating.create(iteration: project1_iteration2, indicator: ind3, score: 4)

Rating.create(iteration: project1_iteration2, indicator: ind3, score: 4)
Rating.create(iteration: project1_iteration2, indicator: ind3, score: 5)