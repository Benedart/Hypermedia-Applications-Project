create table People(
	PersonID int unsigned auto_increment,
	Name varchar(50) not null,
	Surname varchar(50) not null,
	Age int unsigned not null check(Age >= 18),
	Picture blob,
	CV varchar(1500) not null,
	Role varchar(50) not null,

	primary key(PersonID)
);

create table Projects(
	ProjectID int unsigned auto_increment,
	Title varchar(60) not null unique,
	Preview varchar(250) not null,
	Description varchar(1500) not null,
	Budget decimal(10,2) not null check(Budget >= 0),
	Stage varchar(50) not null,
	YearOfFoundation int unsigned not null check(YearOfFoundation >= 1000),
	Supervisor int unsigned not null,

	primary key(ProjectID),
	foreign key(Supervisor) references People(PersonID)
								on delete no action
								on update cascade
);

create table Partecipates(
	PersonID int unsigned not null,
	ProjectID int unsigned not null,

	primary key(PersonID, ProjectID),
	foreign key(PersonID) references People(PersonID)
							on delete cascade
							on update cascade,
	foreign key(ProjectID) references Projects(ProjectID)
							on delete cascade
							on update cascade
);

create table Areas(
	AreaID int unsigned auto_increment,
	Title varchar(50) not null unique,
	Type varchar(50) not null,
	Description varchar(255) not null,

	primary key(AreaID)
);

create table Refers(
	AreaID int unsigned not null,
	ProjectID int unsigned not null,

	primary key(AreaID, ProjectID),
	foreign key (AreaID) references Areas(AreaID)
							on delete cascade
							on update cascade,
	foreign key(ProjectID) references Projects(ProjectID)
							on delete cascade
							on update cascade
);

create table ProjectImages(
	ImageID int unsigned auto_increment,
	ProjectID int unsigned not null,
	Image blob not null,

	primary key(ImageID, ProjectID),
	foreign key(ProjectID) references Projects(ProjectID)
							on delete cascade
							on update cascade
);