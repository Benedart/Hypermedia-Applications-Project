-- Supervisor #1
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'James',
    'Thompson',
    42,
    'JamesThompson@HyperMeow.com',
    'https://www.linkedin.com/in/james-thompson-5753a859/',
    'Education: B.S. in Business Administration from Harvard University; M.B.A. from Stanford Graduate School of Business. Past Job Experience: Investment Banking Analyst at Goldman Sachs; Senior Associate at Bain & Company.',
    'CFO'
);

-- Supervisor #2
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'Linda',
    'Martinez',
    37,
    'LindaMartinez@HyperMeow.com',
    'https://www.linkedin.com/in/lindamartinez100/',
    'Education: B.S. in Computer Science from MIT; Ph.D. in Artificial Intelligence from Carnegie Mellon University. Past Job Experience: Research Scientist at Google DeepMind; Co-founder and CTO at an AI startup.',
    'CTO'
);

-- Supervisor #3
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'Emily',
    'Chen',
    35,
    'EmilyChen@HyperMeow.com',
    'https://www.linkedin.com/in/emily-chen-82b20431/',
    'Education: B.A. in Economics from Yale University; M.S. in Finance from London School of Economics. Past Job Experience: Equity Research Analyst at Morgan Stanley; Portfolio Manager at BlackRock.',
    'CEO'
);

-- Supervisor #4
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'Mark',
    'Robinson',
    40,
    'MarkRobinson@HyperMeow.com',
    'https://www.linkedin.com/in/mark-robinson-959230177/',
    'Education: B.S. in Mechanical Engineering from Caltech; M.S. in Energy Systems from UC Berkeley. Past Job Experience: Project Manager at Tesla; Renewable Energy Consultant at McKinsey & Company.',
    'Project Manager'
);

-- Supervisor #5
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'Sarah',
    'Johnson',
    38,
    'SarahJohnson@HyperMeow.com',
    'https://www.linkedin.com/in/sarah-johnson-35032723a/',
    'Education: B.A. in International Relations from Princeton University; M.P.P. from Harvard Kennedy School. Past Job Experience: Diplomat at the U.S. Department of State; Strategy Consultant at Boston Consulting Group.',
    'Project Manager'
);

-- Supervisor #6
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'David',
    'Brown',
    45,
    'DavidBrown@HyperMeow.com',
    'https://www.linkedin.com/in/david-brown-1835b2b8/',
    'Education: B.S. in Biology from UCLA; M.D. from Johns Hopkins University School of Medicine. Past Job Experience: Medical Director at a major hospital; Healthcare Entrepreneur.',
    'COO'
);

-- Supervisor #7
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'Laura',
    'Adams',
    36,
    'LauraAdams@HyperMeow.com',
    'https://www.linkedin.com/in/lauraadams/',
    'Education: B.S. in Industrial Engineering from Georgia Tech; M.B.A. from Wharton School, University of Pennsylvania. Past Job Experience: Operations Manager at Amazon; Product Manager at a major IoT startup.',
    'Director'
);

-- Supervisor #8
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'Michael',
    'Williams',
    42,
    'MichaelWilliams@HyperMeow.com',
    'https://www.linkedin.com/in/mikewilliams1125/',
    'Education: B.A. in Communication from USC; M.S. in Marketing from Northwestern University. Past Job Experience: Brand Manager at Procter & Gamble; Marketing Director at a leading SaaS company.',
    'CMO'
);

-- Supervisor #9
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'Karen',
    'Lee',
    39,
    'KarenLee@HyperMeow.com',
    'https://www.linkedin.com/in/karenlmx/',
    'Education: B.S. in Environmental Science from Stanford University; Ph.D. in Environmental Policy from Duke University. Past Job Experience: Environmental Scientist at the EPA; Sustainability Consultant at a global firm.',
    'HR Manager'
);

-- Supervisor #10
INSERT INTO People (Name, Surname, Age, Email, Linkedin, CV, Role)
VALUES (
    'Alex',
    'Martin',
    37,
    'AlexMartin@HyperMeow.com',
    'https://www.linkedin.com/in/alex-marti-80546544/',
    'Education: B.S. in Electrical Engineering from the University of Texas at Austin; M.S. in Robotics from MIT. Past Job Experience: Robotics Engineer at a leading robotics company; Co-founder and CEO of an autonomous vehicle startup.',
    'HR'
);

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Project #1: SmartMed Solutions
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Featured, Supervisor)
VALUES (
    'SmartMed Solutions',
    'Healthtech start-up offering an innovative telemedicine platform',
    'SmartMed Solutions is a healthtech start-up founded by a team of experienced medical professionals and software engineers. Their mission is to revolutionize the healthcare industry by leveraging cutting-edge technology to improve patient outcomes and streamline medical processes. The platform allows patients to consult with medical professionals remotely through video conferencing, secure messaging, and file-sharing, and integrates with electronic health records (EHR) systems.',
    'The SmartMed Solutions team is led by CEO Jane Smith, a former hospital administrator with over 15 years of experience in healthcare management, and CTO John Doe, a seasoned software engineer with a strong background in artificial intelligence and machine learning. The team also includes medical experts, developers, and designers with a passion for transforming healthcare.',
    'SmartMed Solutions has received a total investment of $3 million from our venture capital firm. The funding has been allocated in three phases, with an initial investment of $1 million, followed by two subsequent investments of $1 million each, based on the achievement of predetermined milestones.',
    3000000.00,
    'Pre-Seed',
    2023,
    1,
    (SELECT PersonID FROM People WHERE Email = 'KarenLee@HyperMeow.com')
);


-- Project #2: EcoCharge Solutions
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'EcoCharge Solutions',
    'Cleantech start-up developing energy storage and charging solutions for electric vehicles',
    'EcoCharge Solutions is a cleantech start-up focused on developing innovative energy storage and charging solutions for electric vehicles (EVs). Their goal is to accelerate the adoption of EVs by addressing key challenges related to charging infrastructure and battery technology.',
    'CEO Emily Green, a veteran in sustainable energy management, and CTO Michael Brown, an experienced software developer with extensive knowledge in AI and machine learning, spearhead the EcoCharge Solutions team. Their team is composed of experts in energy storage, materials science, and software development, all sharing the zeal to transform the EV sector',
    'Our venture capital firm has made a total investment of $4 million in EcoCharge Solutions. This funding is partitioned into three phases, starting with an initial investment of $1 million, followed by three subsequent investments of $1 million each, contingent on the achievement of predetermined milestones.',
    4000000.00,
    'Series A',
    2020,
    (SELECT PersonID FROM People WHERE Email = 'MichaelWilliams@HyperMeow.com')
);

-- Project #3: AgriTech Pro
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Featured, Supervisor)
VALUES (
    'AgriTech Pro',
    'Agricultural technology start-up focused on data-driven insights and resource optimization',
    'AgriTech Pro is an agricultural technology start-up that is dedicated to transforming the farming industry. Their focus lies in utilizing data-driven insights and advanced technology to maximize crop yields and optimize the use of resources. By implementing an innovative precision agriculture platform, AgriTech Pro provides real-time insights into crop health, soil conditions, and weather patterns. These insights are derived from a combination of satellite imagery, Internet of Things (IoT) devices, and advanced analytics.',
    'The team at AgriTech Pro is led by CEO Sarah Thompson and CTO James White, who guide a team of experienced agronomists, data scientists, and engineers. Their collective expertise is instrumental in advancing the company mission to revolutionize farming practices through technology.',
    'AgriTech Pro has also secured significant funding, with a total investment of $5 million. This investment underscores the potential of their unique approach to modernize agriculture and make farming more sustainable, efficient, and productive.',
    5000000.00,
    'Seed',
    2023,
    1,
    (SELECT PersonID FROM People WHERE Email = 'LauraAdams@HyperMeow.com')
);

-- Project #4: VirtualEdu
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'VirtualEdu',
    'Edtech start-up offering immersive and interactive virtual reality learning experiences',
    'VirtualEdu is an edtech start-up that aims to revolutionize the educational sector by offering immersive and interactive virtual reality (VR) learning experiences. These experiences cater to students across all age groups and cover a wide range of subjects, from history and science to languages and arts.',
    'The team, led by CEO Laura Martinez and CTO Daniel Lee, comprises of experienced educators, curriculum developers, and VR technology experts. Their goal is to make learning more engaging and effective, fostering critical thinking, creativity, and problem-solving skills in students through their VR platform.',
    'VirtualEdu has garnered significant investment, receiving a total of $3.5 million in funding. This investment demonstrates the belief in VirtualEdu vision to redefine education through innovative technology and immersive learning experiences.',
    3500000.00,
    'Series B',
    2021,
    (SELECT PersonID FROM People WHERE Email = 'DavidBrown@HyperMeow.com')
);

-- Project #5: SafeHome Technologies
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'SafeHome Technologies',
    'Home security start-up offering smart home security systems with advanced technology',
    'SafeHome Technologies is a home security start-up that leverages advanced technology to create safer and smarter homes. Their comprehensive smart home security system includes features such as video surveillance, intrusion detection, and remote monitoring through a user-friendly mobile app.',
    'The team at SafeHome, led by CEO Peter Johnson and CTO Lisa Williams, comprises experts in software engineering, Internet of Things (IoT), and home security systems. They utilize machine learning algorithms to analyze data from the security system and provide real-time alerts in case of any suspicious activity, enhancing the overall security of the home.',
    'SafeHome Technologies has received a total investment of $3 million, which underscores the potential and effectiveness of their innovative approach towards home security. Through continuous innovation and a focus on user experience, SafeHome is contributing to a safer and more secure living environment.',
    3000000.00,
    'Pre-Seed',
    2022,
    (SELECT PersonID FROM People WHERE Email = 'SarahJohnson@HyperMeow.com')
);

-- Project #6: SafeGuard AI
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'SafeGuard AI',
    'Security technology start-up developing AI-driven solutions for public safety and emergency response',
    'SafeGuard AI is a security technology start-up committed to enhancing public safety and emergency response through advanced AI-driven solutions. They offer a suite of smart surveillance and analytics tools that utilize cutting-edge computer vision and AI algorithms.',
    'The team, led by CEO Thomas Johnson and CTO Maria Williams, boasts experts in AI, computer vision, and public safety management. Their innovative solutions are designed to constantly monitor public spaces, identify potential threats, and provide real-time alerts to law enforcement and emergency response teams.',
    'SafeGuard AI has attracted a significant investment of $4.5 million, highlighting the confidence in their novel approach to public safety and the effectiveness of their solutions. Through constant innovation and a dedication to societal safety, SafeGuard AI is redefining public security for the modern world.',
    4500000.00,
    'Series C',
    2023,
    (SELECT PersonID FROM People WHERE Email = 'MarkRobinson@HyperMeow.com')
);

-- Project #7: HomeFit
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'HomeFit',
    'Fitness technology start-up offering personalized, data-driven home workout experiences',
    'HomeFit is a fitness technology start-up focused on transforming home workout experiences through personalization and data-driven insights. Their innovative system combines IoT devices, machine learning algorithms, and a vast library of workout content to offer tailored fitness experiences at home.',
    'CEO Jasmine Turner and CTO Kevin Chen lead the HomeFit team, which includes experienced fitness trainers, nutritionists, and software engineers. The team commitment to improving health and fitness has led to the development of a smart home fitness system that goes beyond traditional workout routines.',
    'HomeFit has attracted a significant investment of $3 million, emphasizing the value and potential of their technology in the fitness industry. Despite the start-up relative youth, having launched in 2019, they have already seen a successful exit, indicating the promising future of their unique approach to home fitness.',
    3000000.00,
    'Exit',
    2019,
    (SELECT PersonID FROM People WHERE Email = 'EmilyChen@HyperMeow.com')
);

-- Project #8: TravelEase
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'TravelEase',
    'Travel technology start-up offering a one-stop platform for planning, booking, and managing trips',
    'TravelEase is a travel technology start-up striving to streamline the often complicated process of travel planning, booking, and management. This innovative firm has developed a one-stop platform that connects users to a comprehensive suite of travel services, all aimed at simplifying their travel experience.',
    'The TravelEase team is spearheaded by CEO Ashley Martin and CTO Alex Smith. Combining their diverse expertise in the travel industry and software development, they have created a platform that integrates with various travel service providers, effectively collating a broad array of options for users.',
    'TravelEase has garnered an investment of $2.5 million, reflecting the high potential of their technology in revolutionizing the travel industry. Their focus is on leveraging technology to make travel planning and management as seamless and enjoyable as the journey itself.',
    2500000.00,
    'Series D',
    2020,
    (SELECT PersonID FROM People WHERE Email = 'LindaMartinez@HyperMeow.com')
);

-- Project #9: Clean Ocean Initiative
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
    'Clean Ocean Initiative',
    'Environmental technology start-up developing solutions to combat plastic pollution and preserve marine ecosystems',
    'Clean Ocean Initiative is an environmental technology start-up committed to battling the pressing issue of plastic pollution and safeguarding the health of marine ecosystems. Their solutions combine innovative technology with a deep understanding of the environment, reflecting a dedicated effort to promote sustainable practices and protect our planet natural resources.',
    'The Clean Ocean Initiative team is led by CEO Rachel Adams and CTO Noah Evans. Their collective experience in marine biology, environmental engineering, and material science forms the foundation of their work, enabling them to approach the issue of marine pollution from multiple perspectives.',
    'Clean Ocean Initiative has secured an investment of $4 million, a testament to the growing importance of environmental preservation and the perceived potential of their technology in this critical task. Their ongoing mission is to mitigate plastic pollution effectively, facilitating the preservation of marine life and contributing to overall environmental health.',
    4000000.00,
    'Pre-Seed',
    2022,
    (SELECT PersonID FROM People WHERE Email = 'JamesThompson@HyperMeow.com')
);

-- Project #10: FinBuddy
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'FinBuddy',
'Fintech start-up providing accessible and personalized financial management tools',
'FinBuddy is a fintech start-up that aims to democratize financial management by offering accessible and personalized tools designed to empower individuals and small businesses. Their vision is to provide a comprehensive solution that integrates all aspects of personal finance, allowing users to take control of their financial future.',
'The team behind FinBuddy includes CEO Michelle Clark and CTO Lucas Morgan. The team combines finance professionals with seasoned data analysts and software developers to create a platform that blends expertise in financial management with cutting-edge technological solutions.',
'FinBuddy has successfully secured an investment of $3.5 million, underlining the market confidence in their approach to financial management. This funding will support the continuous development of their platform and the expansion of their financial toolset, ensuring their users have access to the most innovative financial management solutions',
3500000.00,
'Series B',
2021,
(SELECT PersonID FROM People WHERE Email = 'AlexMartin@HyperMeow.com')
);

-- Project #11: SpaceNet
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'SpaceNet',
'Aerospace technology start-up offering high-speed, reliable, and affordable satellite connectivity solutions',
'SpaceNet is an aerospace technology start-up, dedicated to transforming the field of satellite communications. Their mission is to provide high-speed, reliable, and affordable satellite connectivity solutions, with a particular focus on serving remote and underserved areas. This dedication stems from the recognition that in our increasingly interconnected world, access to reliable internet and communication services is a necessity, not a luxury.',
'The team driving SpaceNet is a fusion of talent and expertise. CEO Katherine Ross and CTO Benjamin Johnson lead a group of experienced satellite engineers, telecommunications experts, and software developers. This mix of skills enables them to tackle the multifaceted challenges inherent in the field of satellite communications.',
'To propel their vision forward, SpaceNet has secured a substantial investment of $5 million. This funding will support their ongoing efforts to refine their satellite network and expand their coverage, ensuring that they continue to provide high-speed, reliable, and affordable connectivity solutions.',
5000000.00,
'Exit',
2022,
(SELECT PersonID FROM People WHERE Email = 'MarkRobinson@HyperMeow.com')
);

-- Project #12: FoodSustain
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'FoodSustain',
'Food technology start-up focused on reducing food waste and promoting sustainable food consumption',
'FoodSustain is a food technology start-up that is dedicated to combating food waste and promoting sustainable consumption habits. The start-up achieves this mission through the development and deployment of innovative solutions that focus on enhancing food preservation and optimizing the supply chain.',
'The team behind FoodSustain, led by CEO Olivia Miller and CTO Ethan Wilson, consists of a diverse group of professionals with expertise in areas such as food science, supply chain management, and software engineering. Their combined knowledge and experience allow FoodSustain to tackle the multifaceted issue of food waste from multiple angles.',
'To support their operations and future research and development, FoodSustain has secured an investment of $4 million. This funding will fuel their efforts to continually enhance their technology and broaden their impact, as they strive towards a future where food waste is significantly reduced and sustainable food consumption is the norm.',
4000000.00,
'Pre-Seed',
2023,
(SELECT PersonID FROM People WHERE Email = 'LindaMartinez@HyperMeow.com')
);

-- Project #13: SeniorCare+
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'SeniorCare+',
'Healthcare technology start-up providing innovative care solutions for the elderly population',
'SeniorCare+ is a healthcare technology start-up that specializes in developing innovative and personalized care solutions tailored for the elderly population. The start-up central focus is to improve the quality of life for seniors by providing accessible care solutions that cater to their unique needs.',
'The SeniorCare+ team, helmed by CEO Rebecca Turner and CTO Martin Lee, is a diverse blend of professionals from various disciplines. The team includes experienced geriatric care professionals, medical researchers, and software developers, all of whom contribute to the company mission to improve elderly care through technology.',
'To date, SeniorCare+ has secured a total investment of $3.2 million. This funding will be instrumental in further enhancing their platform and extending their services to more seniors, thereby contributing significantly to improved healthcare delivery for the elderly.',
3200000.00,
'Series C',
2019,
(SELECT PersonID FROM People WHERE Email = 'EmilyChen@HyperMeow.com')
);

-- Project #14: UrbanGrow
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Featured, Supervisor)
VALUES (
'UrbanGrow',
'Green technology start-up offering innovative vertical farming solutions for urban environments',
'UrbanGrow is a green technology start-up that is paving the way for sustainable urban development by introducing innovative vertical farming solutions suitable for urban environments. This initiative is driven by a mission to transform urban landscapes and enhance local food security.',
'The team behind UrbanGrow, led by CEO Daniel Jackson and CTO Samantha Lee, comprises a dynamic mix of professionals, including experienced horticulturists, architects, and environmental engineers. Together, they strive to redefine urban farming practices and contribute to greener, more sustainable cities.',
'To date, UrbanGrow has received a total investment of $2.8 million, which is set to fuel further innovation and expansion as the company continues to revolutionize urban farming practices.',
2800000.00,
'Series A',
2023,
1,
(SELECT PersonID FROM People WHERE Email = 'DavidBrown@HyperMeow.com')
);

-- Project #15: MedAssist AI
INSERT INTO Projects (Title, Preview, Section1, Section2, Section3, Budget, Stage, YearOfFoundation, Supervisor)
VALUES (
'MedAssist AI',
'Healthcare technology start-up leveraging AI and machine learning to improve medical diagnosis, treatment, and management',
'MedAssist AI is a healthcare technology start-up that harnesses the power of artificial intelligence (AI) and machine learning to advance medical diagnosis, treatment, and management. Their goal is to enhance healthcare outcomes and optimize the delivery of medical services through innovative technological solutions.',
'CEO Dr. Allison Grant and CTO Dr. Charles Kim lead the MedAssist AI team, which consists of experienced medical professionals, AI researchers, and software engineers. This diverse expertise enables the development of cutting-edge AI-driven tools that benefit both healthcare professionals and patients.',
'To support their mission, MedAssist AI has secured a significant investment of $4.2 million. This funding will drive further research and development, allowing MedAssist AI to continuously refine their AI algorithms, expand their diagnostic capabilities, and contribute to the advancement of medical care.',
4200000.00,
'Series B',
2021,
(SELECT PersonID FROM People WHERE Email = 'LauraAdams@HyperMeow.com')
);

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Area #1
INSERT INTO Areas (Title, Section1, Section2)
VALUES
('Healthcare',
'Healthcare, as an interdisciplinary domain, is situated at the intersection of life sciences, public safety, and healthcare services. This multifaceted domain embraces a holistic strategy aimed at augmenting human wellness and guaranteeing societal safety. At its core, it seeks to utilize state-of-the-art technology and scientific expertise to improve health outcomes, streamline medical procedures, and democratize access to healthcare services for all individuals.',
'Healthcare Services

Healthcare services is primarily devoted to elevating patient outcomes through the employment of cutting-edge technology. Ground-breaking advancements such as AI-driven diagnostics, telehealth solutions, and personalized medicine are being harnessed to provide more accurate, swift, and custom healthcare services. By incorporating technology into healthcare, the aim is to enhance the efficiency of medical processes, curtail waiting periods, and amplify the overall patient experience.

Public Safety

Public safety constitutes another fundamental pillar of this domain, focusing on formulating strong and efficient solutions for public security and emergency response. Emerging technologies like artificial intelligence (AI), computer vision, and the Internet of Things (IoT) are being exploited to create systems capable of predicting, preventing, and responding promptly to public safety incidents. This broad scope includes facets like traffic management, crime prevention, disaster response, and ensuring safety in public areas.

Life Sciences

Life sciences represent the third aspect of the healthcare domain, emphasizing the integration of technology to foster overall well-being. It spans the utilization of technology in sectors like biomedical research, pharmaceutical development, genomics, and personalized nutrition. The overarching goal here is to cultivate a deeper comprehension of human health and disease, subsequently using these insights to craft solutions that uplift the overall quality of life.');

-- Area #2
INSERT INTO Areas (Title, Section1, Section2)
VALUES
('EcoSustain',
'EcoSustain is an intersectional domain that lies at the crossroads of technology, environment, and agriculture, symbolizing a deep-rooted commitment to sustainability and the welfare of our planet. The area is marked by the development and execution of forward-thinking technologies, with a clear aim to endorse environmental sustainability, alleviate pollution, and amplify resource efficiency.',

'Environmental Sustainability & Resource Management
Central to EcoSustain is a vision of a purer, greener, and more sustainable planet. This is actualized through the implementation of avant-garde technologies tailored to reduce environmental footprints and refine how we exploit Earth precious resources. This involves progress in renewable energy, waste management, and recycling technologies, as well as inventive solutions that aim to curb pollution and endorse cleaner air and water.

Agriculture & Sustainable Farming Practices

Agriculture forms another crucial aspect of EcoSustain, with an emphasis on optimizing farming methods and managing resources more effectively. Achieving this involves the integration of data-driven insights and state-of-the-art technologies like precision farming, automated irrigation systems, and satellite imaging. These instruments not only aid in maximizing crop yields and enhancing livestock management but also ensure these procedures are conducted sustainably, with minimal impact on the environment.

Sustainable Food Consumption

In addition, EcoSustain recognizes the vital role sustainable food consumption plays in environmental preservation. This encompasses endorsing sustainable diets, reducing food waste, and facilitating a transition towards more sustainable food production practices.');

-- Area #3
INSERT INTO Areas (Title, Section1, Section2)
VALUES
('Technology',
'"Technology" is an expansive domain that encompasses the ever-evolving technological advancements across a diverse range of industries. It stands as a shining testament to human ingenuity and the boundless potential of contemporary computing. At the heart of this domain lies the development and improvement of algorithms and systems capable of learning from data, representing the tangible embodiment of machine intelligence.',
'Internet of Things (IoT)

A vital component of this domain is the Internet of Things (IoT), a network of physical objects—often called "things"—embedded with sensors, software, and other technologies to facilitate data exchange with other devices and systems over the internet. IoT has extensive applications in myriad industries, spanning from home automation and healthcare to manufacturing and beyond.

Virtual Reality (VR)

Virtual Reality (VR) represents another exhilarating aspect of technology, delivering immersive experiences that blur the boundaries between the physical and digital worlds. Its implications extend across sectors like gaming, education, and even real estate.

Home Automation

Home Automation is an embodiment of IoT applications in personal spaces, aimed at improving comfort, efficiency, and security. It involves a wide array of features, including smart lighting, temperature control, and advanced security systems.

Robotics and Computer Vision

The merger of physical systems with intelligent software is manifested in the fields of Robotics and Computer Vision. These technologies enable machines to interact with their environments, recognize objects or faces, and carry out complex tasks, revolutionizing industries like manufacturing, healthcare, and transportation.

Satellite Communications

Satellite Communications is a crucial sector, underpinning global connectivity and data exchange. This technology has significant impacts on navigation, weather forecasting, and global communication networks.

Medical Imaging

Lastly, Medical Imaging illustrates the application of technology within healthcare, enhancing diagnostic and treatment capabilities. Innovations in this field hold the potential to detect diseases earlier and with greater accuracy, dramatically improving patient outcomes.');

-- Area #4
INSERT INTO Areas (Title, Section1, Section2)
VALUES
('Growth',
'"Growth" is a multifaceted domain encompassing the sectors of finance, education, and travel. Its central objective is to promote individual and collective development through the application of innovative technological solutions.',
'Finance

In the sphere of finance, our concentration is on democratizing access to this field by providing user-friendly and personalized financial management tools. These tools are specifically designed to cater to the requirements of individuals and small enterprises, empowering them to make informed decisions and take proactive control of their financial well-being.

Education

Education, another pivotal component of this domain, is reconceptualized through the prism of advanced technology. Our goal is to curate immersive learning experiences that inspire and engage learners. By capitalizing on the possibilities of contemporary tech, we aim to revolutionize traditional learning paradigms, making education more interactive, effective, and enjoyable.

Travel

The travel sector is geared towards simplifying the overarching travel experience. With the help of technology, we aspire to smooth out travel logistics, rendering journeys more seamless and enjoyable. Our solutions target common travel inconveniences, aiming to offer a more streamlined, pleasurable, and personalized experience for all travelers.

To encapsulate, the "Growth" domain is devoted to leveraging the potential of technology to fuel personal and economic development. We strongly endorse the transformative power of innovation to enhance experiences and drive progress within these crucial sectors of our lives.');
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Areas Refers Projects
INSERT INTO Refers (AreaID, ProjectID)
VALUES
(1, 1), (1, 5), (1, 6), (1, 7), (1, 12), (1, 13), (1, 15),
(2, 2), (2, 3), (2, 9), (2, 12), (2, 14),
(3, 1), (3, 4), (3, 11), (3, 13), (3, 15),
(4, 4), (4, 8), (4, 10);

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
