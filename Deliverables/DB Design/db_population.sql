-- Supervisor #1
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'James',
    'Thompson',
    42,
    'JamesThompson@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/JamesThompson.webp',
    'Education: B.S. in Business Administration from Harvard University; M.B.A. from Stanford Graduate School of Business. Past Job Experience: Investment Banking Analyst at Goldman Sachs; Senior Associate at Bain & Company.',
    'CFO'
);

-- Supervisor #2
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'Linda',
    'Martinez',
    37,
    'LindaMartinez@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/LindaMartinez.webp',
    'Education: B.S. in Computer Science from MIT; Ph.D. in Artificial Intelligence from Carnegie Mellon University. Past Job Experience: Research Scientist at Google DeepMind; Co-founder and CTO at an AI startup.',
    'CTO'
);

-- Supervisor #3
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'Emily',
    'Chen',
    35,
    'EmilyChen@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/EmilyChen.webp',
    'Education: B.A. in Economics from Yale University; M.S. in Finance from London School of Economics. Past Job Experience: Equity Research Analyst at Morgan Stanley; Portfolio Manager at BlackRock.',
    'CEO'
);

-- Supervisor #4
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'Mark',
    'Robinson',
    40,
    'MarkRobinson@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/MarkRobinson.webp',
    'Education: B.S. in Mechanical Engineering from Caltech; M.S. in Energy Systems from UC Berkeley. Past Job Experience: Project Manager at Tesla; Renewable Energy Consultant at McKinsey & Company.',
    'Project Manager'
);

-- Supervisor #5
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'Sarah',
    'Johnson',
    38,
    'SarahJohnson@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/SarahJohnson.webp',
    'Education: B.A. in International Relations from Princeton University; M.P.P. from Harvard Kennedy School. Past Job Experience: Diplomat at the U.S. Department of State; Strategy Consultant at Boston Consulting Group.',
    'Project Manager'
);

-- Supervisor #6
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'David',
    'Brown',
    45,
    'DavidBrown@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/DavidBrown.webp',
    'Education: B.S. in Biology from UCLA; M.D. from Johns Hopkins University School of Medicine. Past Job Experience: Medical Director at a major hospital; Healthcare Entrepreneur.',
    'COO'
);

-- Supervisor #7
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'Laura',
    'Adams',
    36,
    'LauraAdams@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/LauraAdams.webp',
    'Education: B.S. in Industrial Engineering from Georgia Tech; M.B.A. from Wharton School, University of Pennsylvania. Past Job Experience: Operations Manager at Amazon; Product Manager at a major IoT startup.',
    'Director'
);

-- Supervisor #8
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'Michael',
    'Williams',
    42,
    'MichaelWilliams@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/MichaelWilliams.webp',
    'Education: B.A. in Communication from USC; M.S. in Marketing from Northwestern University. Past Job Experience: Brand Manager at Procter & Gamble; Marketing Director at a leading SaaS company.',
    'CMO'
);

-- Supervisor #9
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'Karen',
    'Lee',
    39,
    'KarenLee@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/KarenLee.webp',
    'Education: B.S. in Environmental Science from Stanford University; Ph.D. in Environmental Policy from Duke University. Past Job Experience: Environmental Scientist at the EPA; Sustainability Consultant at a global firm.',
    'HR Manager'
);

-- Supervisor #10
INSERT INTO People (Name, Surname, Age, Email, Linkedin, Picture, CV, Role)
VALUES (
    'Alex',
    'Martin',
    37,
    'AlexMartin@gmail.com',
    'https://www.linkedin.com/feed/',
    '/Pictures/People/AlexMartin.webp',
    'Education: B.S. in Electrical Engineering from the University of Texas at Austin; M.S. in Robotics from MIT. Past Job Experience: Robotics Engineer at a leading robotics company; Co-founder and CEO of an autonomous vehicle startup.',
    'HR'
);
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Project #1: SmartMed Solutions
INSERT INTO Projects (Title,Preview,Description,Budget, Stage,YearOfFoundation,Supervisor)
VALUES (
    'SmartMed Solutions',
    'Healthtech start-up offering an innovative telemedicine platform',
    'SmartMed Solutions is a healthtech start-up founded by a team of experienced medical professionals and software engineers. Their mission is to revolutionize the healthcare industry by leveraging cutting-edge technology to improve patient outcomes and streamline medical processes. The platform allows patients to consult with medical professionals remotely through video conferencing, secure messaging, and file-sharing, and integrates with electronic health records (EHR) systems.',
    3000000.00,
    'Pre-Seed',
    2023,
    (SELECT PersonID FROM People WHERE Email = 'KarenLee@gmail.com')
);

-- Project #2: EcoCharge Solutions
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'EcoCharge Solutions',
    'Cleantech start-up developing energy storage and charging solutions for electric vehicles',
    'EcoCharge Solutions is a cleantech start-up focused on developing innovative energy storage and charging solutions for electric vehicles (EVs). Their goal is to accelerate the adoption of EVs by addressing key challenges related to charging infrastructure and battery technology. The team is led by CEO Emily Green and CTO Michael Brown, with experts in energy storage, materials science, and software development. They offer a smart charging station network that uses AI and machine learning algorithms to optimize charging times and power distribution, reducing energy costs and ensuring efficient use of the grid. Their proprietary battery technology also extends the range of electric vehicles.',
    4000000.00,
    'Series A',
    2020,
    (SELECT PersonID FROM People WHERE Email = 'MichaelWilliams@gmail.com')
);

-- Project #3: AgriTech Pro
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'AgriTech Pro',
    'Agricultural technology start-up focused on data-driven insights and resource optimization',
    'AgriTech Pro is an agricultural technology start-up dedicated to revolutionizing the farming industry by harnessing the power of data-driven insights and cutting-edge technology to increase crop yields and optimize resource usage. The team is led by CEO Sarah Thompson and CTO James White, with experienced agronomists, data scientists, and engineers. They offer a comprehensive precision agriculture platform that combines satellite imagery, IoT devices, and advanced analytics to provide real-time insights on crop health, soil conditions, and weather patterns.',
    5000000.00,
    'Seed',
    2023,
    (SELECT PersonID FROM People WHERE Email = 'LauraAdams@gmail.com')
);

-- Project #4: VirtualEdu
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'VirtualEdu',
    'Edtech start-up offering immersive and interactive virtual reality learning experiences',
    'VirtualEdu is an edtech start-up focused on transforming the educational landscape by providing immersive and interactive virtual reality (VR) learning experiences for students of all ages. The team is led by CEO Laura Martinez and CTO Daniel Lee, with experienced educators, curriculum developers, and VR technology experts. They offer a comprehensive VR learning platform that covers a wide range of subjects, from history and science to language and art, enabling students to engage in interactive learning experiences that foster creativity, critical thinking, and problem-solving skills.',
    3500000.00,
    'Series B',
    2021,
    (SELECT PersonID FROM People WHERE Email = 'DavidBrown@gmail.com')
);

-- Project #5: SafeHome Technologies
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'SafeHome Technologies',
    'Home security start-up offering smart home security systems with advanced technology',
    'SafeHome Technologies is a home security start-up dedicated to making homes smarter and safer through the integration of advanced technology and user-friendly systems. The team is led by CEO Peter Johnson and CTO Lisa Williams, with experts in software engineering, IoT, and home security systems. They offer a comprehensive smart home security system that includes video surveillance, intrusion detection, and remote monitoring through a user-friendly mobile app, using machine learning algorithms to analyze data and provide real-time alerts in case of suspicious activity.',
    3000000.00,
    'Pre-Seed',
    2022,
    (SELECT PersonID FROM People WHERE Email = 'SarahJohnson@gmail.com')
);

-- Project #6: SafeGuard AI
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'SafeGuard AI',
    'Security technology start-up developing AI-driven solutions for public safety and emergency response',
    'SafeGuard AI is a security technology start-up focused on developing advanced artificial intelligence-driven solutions to improve public safety and emergency response. The team is led by CEO Thomas Johnson and CTO Maria Williams, with experts in AI, computer vision, and public safety management. They offer a suite of smart surveillance and analytics solutions that utilize advanced computer vision and AI algorithms to monitor public spaces, detect potential threats, and provide real-time alerts to law enforcement and emergency response teams.',
    4500000.00,
    'Series C',
    2023,
    (SELECT PersonID FROM People WHERE Email = 'MarkRobinson@gmail.com')
);

-- Project #7: HomeFit
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'HomeFit',
    'Fitness technology start-up offering personalized, data-driven home workout experiences',
    'HomeFit is a fitness technology start-up aiming to revolutionize the way people exercise at home by providing a personalized, data-driven workout experience. The team is led by CEO Jasmine Turner and CTO Kevin Chen, with experienced fitness trainers, nutritionists, and software engineers. They offer a smart home fitness system that combines IoT devices, machine learning algorithms, and an extensive library of workout content, tracking users progress, analyzing performance data, and providing personalized workout recommendations.',
    3000000.00,
    'Exit',
    2019,
    (SELECT PersonID FROM People WHERE Email = 'EmilyChen@gmail.com')
);

-- Project #8: TravelEase
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'TravelEase',
    'Travel technology start-up offering a one-stop platform for planning, booking, and managing trips',
    'TravelEase is a travel technology start-up dedicated to simplifying the travel experience by providing a one-stop platform for planning, booking, and managing trips. The team is led by CEO Ashley Martin and CTO Alex Smith, with experienced travel industry professionals and software developers. They offer a comprehensive travel planning and booking platform that integrates with various travel service providers and uses AI-driven algorithms to provide personalized trip recommendations and optimize travel itineraries, also featuring a robust travel management system.',
    2500000.00,
    'Series D',
    2020,
    (SELECT PersonID FROM People WHERE Email = 'LindaMartinez@gmail.com')
);

-- Project #9: Clean Ocean Initiative
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'Clean Ocean Initiative',
    'Environmental technology start-up developing solutions to combat plastic pollution and preserve marine ecosystems',
    'Clean Ocean Initiative is an environmental technology start-up dedicated to developing innovative solutions for combating plastic pollution and preserving marine ecosystems. The team is led by CEO Rachel Adams and CTO Noah Evans, with experienced marine biologists, environmental engineers, and material scientists. They offer a cutting-edge plastic collection and recycling system that uses advanced robotics and AI algorithms to identify and remove plastic waste from oceans and waterways, processing the collected plastic into valuable raw materials.',
    4000000.00,
    'Pre-Seed',
    2022,
    (SELECT PersonID FROM People WHERE Email = 'JamesThompson@gmail.com')
);

-- Project #10: FinBuddy
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'FinBuddy',
'Fintech start-up providing accessible and personalized financial management tools',
'FinBuddy is a fintech start-up focused on providing accessible and personalized financial management tools for individuals and small businesses. The team is led by CEO Michelle Clark and CTO Lucas Morgan, with experienced finance professionals, data analysts, and software developers. They offer a comprehensive financial management platform that integrates with bank accounts, credit cards, and investment portfolios, leveraging AI and machine learning algorithms to offer personalized financial advice and automate savings strategies, helping users achieve their financial goals.',
3500000.00,
'Series B',
2021,
(SELECT PersonID FROM People WHERE Email = 'AlexMartin@gmail.com')
);

-- Project #11: SpaceNet
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'SpaceNet',
'Aerospace technology start-up offering high-speed, reliable, and affordable satellite connectivity solutions',
'SpaceNet is an aerospace technology start-up aiming to revolutionize the satellite communications industry by providing high-speed, reliable, and affordable connectivity solutions for remote and underserved areas. The team is led by CEO Katherine Ross and CTO Benjamin Johnson, with experienced satellite engineers, telecommunications experts, and software developers. They offer a next-generation satellite network that leverages advanced antenna technology and efficient spectrum allocation to provide high-speed internet and communication services worldwide, bridging the digital divide and unlocking new opportunities.',
5000000.00,
'Exit',
2022,
(SELECT PersonID FROM People WHERE Email = 'MarkRobinson@gmail.com')
);

-- Project #12: FoodSustain
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'FoodSustain',
'Food technology start-up focused on reducing food waste and promoting sustainable food consumption',
'FoodSustain is a food technology start-up committed to reducing food waste and promoting sustainable food consumption by developing innovative solutions for food preservation and supply chain optimization. The team is led by CEO Olivia Miller and CTO Ethan Wilson, with experienced food scientists, supply chain experts, and software engineers. They offer a proprietary food packaging technology and a supply chain management platform that uses AI-driven algorithms to optimize inventory management, logistics, and demand forecasting, minimizing food waste and improving resource efficiency.',
4000000.00,
'Pre-Seed',
2023,
(SELECT PersonID FROM People WHERE Email = 'LindaMartinez@gmail.com')
);

-- Project #13: SeniorCare+
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'SeniorCare+',
'Healthcare technology start-up providing innovative care solutions for the elderly population',
'SeniorCare+ is a healthcare technology start-up focused on providing innovative, personalized, and accessible care solutions for the elderly population. The team is led by CEO Rebecca Turner and CTO Martin Lee, with experienced geriatric care professionals, medical researchers, and software developers. They offer a comprehensive telehealth platform specifically designed for seniors, featuring AI-driven tools for fall detection, medication reminders, and health data analysis, ensuring timely interventions and personalized care plans for each user.',
3200000.00,
'Series C',
2019,
(SELECT PersonID FROM People WHERE Email = 'EmilyChen@gmail.com')
);

-- Project #14: UrbanGrow
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'UrbanGrow',
'Green technology start-up offering innovative vertical farming solutions for urban environments',
'UrbanGrow is a green technology start-up dedicated to promoting sustainable urban development by offering innovative vertical farming solutions for urban environments. The team is led by CEO Daniel Jackson and CTO Samantha Lee, with experienced horticulturists, architects, and environmental engineers. They provide modular vertical farming systems that utilize advanced hydroponic technology, energy-efficient LED lighting, and IoT-enabled climate control to optimize plant growth and resource usage, aiming to reduce transportation emissions, promote local food production, and enhance food security in urban communities.',
2800000.00,
'Series A',
2023,
(SELECT PersonID FROM People WHERE Email = 'DavidBrown@gmail.com')
);

-- Project #15: MedAssist AI
INSERT INTO Projects (Title, Preview, Description, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'MedAssist AI',
'Healthcare technology start-up leveraging AI and machine learning to improve medical diagnosis, treatment, and management',
'MedAssist AI is a healthcare technology start-up focused on leveraging artificial intelligence and machine learning to improve the diagnosis, treatment, and management of various medical conditions. The team is led by CEO Dr. Allison Grant and CTO Dr. Charles Kim, with experienced medical professionals, AI researchers, and software engineers. They offer a cutting-edge AI-driven diagnostic platform that analyzes medical images, laboratory test results, and patient history data to assist healthcare professionals in making more accurate and timely diagnoses. The platform also includes a suite of AI-powered tools for personalized treatment planning and remote patient monitoring, enabling better patient outcomes and more efficient healthcare delivery.',
4200000.00,
'Series B',
2021,
(SELECT PersonID FROM People WHERE Email = 'LauraAdams@gmail.com')
);

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Area #1
INSERT INTO Areas (Title, Type, Description)
VALUES
('Health',
'Sector',
'The health sector focuses on improving patient outcomes, streamlining medical processes, and providing accessible care for various populations, including the elderly. This area involves the use of technology to enhance healthcare delivery and promote overall well-being.');

-- Area #2
INSERT INTO Areas (Title, Type, Description)
VALUES
('Green/Cleantech',
'Sector',
'This area is dedicated to developing innovative technologies and solutions that promote environmental sustainability, reduce pollution, and improve resource efficiency. It covers a range of topics, including renewable energy, waste management, and sustainable urban development.');

-- Area #3
INSERT INTO Areas (Title, Type, Description)
VALUES
('Agriculture',
'Sector',
'The agriculture sector deals with the optimization of farming practices, resource management, and food production using data-driven insights and cutting-edge technologies. It aims to improve crop yields, reduce waste, and promote sustainable food consumption.');

-- Area #4
INSERT INTO Areas (Title, Type, Description)
VALUES
('Education',
'Sector',
'The education sector focuses on using advanced technology to create immersive, interactive, and engaging learning experiences for students of all ages, including the use of virtual reality in teaching and learning.');

-- Area #5
INSERT INTO Areas (Title, Type, Description)
VALUES
('Home Security/IoT',
'Sector',
'The home security and IoT (Internet of Things) area involves the integration of advanced technology and user-friendly systems to create smarter, safer homes. This sector also includes the development of personalized home fitness experiences.');

-- Area #6
INSERT INTO Areas (Title, Type, Description)
VALUES
('Public Safety',
'Sector',
'Public safety is concerned with developing solutions to improve safety and emergency response using advanced technology, such as AI-driven surveillance systems and analytics.');

-- Area #7
INSERT INTO Areas (Title, Type, Description)
VALUES
('Travel',
'Sector',
'The travel sector aims to simplify the travel experience by leveraging technology to create comprehensive platforms for planning, booking, and managing trips, utilizing AI-driven algorithms for personalization and efficiency.');

-- Area #8
INSERT INTO Areas (Title, Type, Description)
VALUES
('Environment',
'Sector',
'The environmental sector addresses issues like plastic pollution, marine ecosystem preservation, and sustainable urban development. It explores innovative solutions such as vertical farming and plastic waste removal in oceans and waterways.');

-- Area #9
INSERT INTO Areas (Title, Type, Description)
VALUES
('Finance',
'Sector',
'The finance sector focuses on providing accessible and personalized financial management tools for individuals and small businesses. This includes the development of comprehensive platforms for managing personal finances and supporting business operations.');

-- Area #10
INSERT INTO Areas (Title, Type, Description)
VALUES
('Aerospace',
'Sector',
'The aerospace sector seeks to revolutionize satellite communications and connectivity solutions by offering high-speed, reliable, and affordable services for remote and underserved areas, utilizing advanced technologies and innovative approaches.');

-- Area #11
INSERT INTO Areas (Title, Type, Description)
VALUES
('Food Technology',
'Sector',
'Food technology is concerned with reducing food waste and promoting sustainable food consumption through the development of innovative food preservation techniques and supply chain optimization solutions.');

-- Area #12
INSERT INTO Areas (Title, Type, Description)
VALUES
('Elderly Care',
'Sector',
'Elderly care focuses on providing innovative, personalized, and accessible care solutions for the elderly population. This may involve the use of telehealth platforms to deliver remote healthcare and support services.');

-- Area #13
INSERT INTO Areas (Title, Type, Description)
VALUES
('Urban Agriculture',
'Sector',
'Urban agriculture promotes sustainable urban development by offering innovative vertical farming solutions for urban environments, enabling local food production and resource-efficient cultivation methods.');

-- Area #14
INSERT INTO Areas (Title, Type, Description)
VALUES
('Medical AI',
'Sector',
'Medical AI is centered around the use of artificial intelligence and machine learning to improve the diagnosis, treatment, and management of various medical conditions, supporting healthcare professionals in delivering more accurate and timely care.');

-- Area #15
INSERT INTO Areas (Title, Type, Description)
VALUES
('Artificial Intelligence (AI) and Machine Learning',
'Technology',
'These technologies involve the development of algorithms and systems that can learn from data, recognize patterns, and make decisions, improving various services across different sectors.');

-- Area #16
INSERT INTO Areas (Title, Type, Description)
VALUES
('Internet of Things (IoT)',
'Technology',
'IoT refers to the network of interconnected physical devices, sensors, and software that communicate and exchange data, providing real-time insights and personalized services across different industries.');

-- Area #17
INSERT INTO Areas (Title, Type, Description)
VALUES
('Virtual Reality (VR)',
'Technology',
'VR is a technology that creates immersive and interactive simulated environments, enabling users to experience lifelike scenarios, often used in education, gaming, and training.');

-- Area #18
INSERT INTO Areas (Title, Type, Description)
VALUES
('Home Automation',
'Technology',
'Home automation involves integrating advanced technology with home security and other systems to create smart homes, improving efficiency, security, and convenience for homeowners.');

-- Area #19
INSERT INTO Areas (Title, Type, Description)
VALUES
('Robotics and Computer Vision',
'Technology',
'Robotics and computer vision technologies involve the development of advanced robots and AI algorithms to perform tasks such as identifying objects, recognizing patterns, and making decisions, with applications in public safety, environmental protection, and more.');

-- Area #20
INSERT INTO Areas (Title, Type, Description)
VALUES
('Satellite Communications',
'Technology',
'Satellite communication technology uses advanced antenna systems and efficient spectrum allocation to provide high-speed internet and communication services, particularly for remote and underserved areas.');

-- Area #21
INSERT INTO Areas (Title, Type, Description)
VALUES
('Food Preservation and Supply Chain Optimization',
'Technology',
'This area focuses on developing innovative solutions to reduce food waste and promote sustainable food consumption through food preservation techniques and optimization of supply chains.');

-- Area #22
INSERT INTO Areas (Title, Type, Description)
VALUES
('Telehealth and Elderly Care',
'Technology',
'Telehealth and elderly care involve the use of technology, such as telehealth platforms, to provide innovative, personalized, and accessible care solutions for the elderly population, often including remote medical consultations and monitoring.');

-- Area #23
INSERT INTO Areas (Title, Type, Description)
VALUES
('Vertical Farming and Urban Agriculture',
'Technology',
'Vertical farming and urban agriculture focus on sustainable urban development by offering innovative vertical farming solutions for urban environments. These solutions often use advanced hydroponic technology, energy-efficient lighting, and IoT-enabled climate control systems.');

-- Area #24
INSERT INTO Areas (Title, Type, Description)
VALUES
('Medical Imaging and AI-powered Diagnostics',
'Technology',
'This area combines artificial intelligence and machine learning with medical imaging to improve the diagnosis, treatment, and management of various medical conditions. This technology often includes AI-driven diagnostic platforms and personalized treatment planning tools.');

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Areas Refers Projects
INSERT INTO Refers (AreaID, ProjectID)
VALUES
(1, 1), (1, 13),
(2, 2), (2, 9), (2, 14),
(3, 3), (3, 12),
(4, 4),
(5, 5), (5, 7),
(6, 6),
(7, 8),
(8, 9), (8, 14),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 1), (15, 2), (15, 6), (15, 7), (15, 8), (15, 10), (15, 13), (15, 15),
(16, 3), (16, 5), (16, 7),
(17, 4),
(18, 5),
(19, 6), (19, 9),
(20, 11),
(21, 12),
(22, 13),
(23, 14),
(24, 15);

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
