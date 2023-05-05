-- all projects
select projectid, title, preview, stage from projects

-- all people
select * from people

-- info about the selected project
select projectid, p.title, p.description, budget, yearoffoundation, supervisor, name, surname, a.areaid, a.title as area, a.type
from ((projects as p join people on personId = supervisor) natural join refers as r) join areas as a on r.areaId = a.areaId
where ProjectID = %s

-- projects by date
select projectid, title, preview, stage
from projects
where YearOfFoundation = %s

-- projects by budget
select projectid, title, preview, stage
from projects
where budget = %s

-- projects by stage
select projectid, title, preview, stage
from projects
where stage = %s

-- projects by supervisor
select projectid, title, preview, stage
from projects
where Supervisor = %s

-- projects by areas
select projectid, title, preview, stage
from refers natural join projects
where AreaID = %s

-- all areas
select AreaID
from areas

-- all dates
select projectid, YearOfFoundation
from projects

-- all supervisors
select projectid, personid, name, surname
from people join projects on personID = supervisor

-- all budgets
select projectid, budget
from projects

-- all stages
select projectid, stage
from projects