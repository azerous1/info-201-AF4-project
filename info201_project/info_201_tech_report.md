## **Global Terrorism**

##### _Group Project Part 2_
##### Technical Report

Team members: Jerry Wang, Yichi Zhang, Clover Li, Xinye Li

Info-201: Technical Foundations of Informatics

The Information School

University of Washington

Autumn 2019


### 1.0 Introduction

##### 1.1 Problem situation

> The direct stakeholders of the problem situation are government officials, national homeland security departments. The indirect stakeholders in the case would be terrorist organizations and all citizens in general. Because of divergent ideologies in politics, culture, and other factors, terrorism is still a threat and a problem to the civil society of some countries. It is important to be inclusive in every community in the society in order to address the potential threat of terrorism to the country, regardless of motives, race, and culture.  Valuing humanity and people’s equal rights play a key role in this case. Public policy implementation of the national government, the United Nations, and other international NGOs that aim to address the terrorism problem would help reduce the threat of terrorism if the issue could eventually be mitigated around the world.
<br><br>
The existing research primarily focuses on jihadism; therefore, other types of terrorism, such as right-wing extremists terrorism and state terrorism, are greatly underrepresented overall. And the major works on terrorism were done in small group of researchers with narrower scope. It is important for a larger community of terrorism scholars to dedicate their efforts to aim for more comprehensive research on a variety of types of terrorism in the future. Our group members are interested in politics and global current events in daily routine. We realized that even though terrorism sometimes does not cause a great number of casualties, terrorism provokes deep fear and insecurity more than other forms of violence. Terrorists strike innocent civilians randomly and without warning. The national governments think they are capable of protecting their citizens against other forms of violence, but all people, in general, feel defenseless against terrorists. We would like to analyze the trends of past terrorist attacks to see whether there is a pattern in the past two decades and study on potential correlation among weapons types, casualty numbers, and regions over the last twenty years.
<br><br>
In the Envisioning Cards, non-targeted Use card is referring to the people use the system in a way that is different than designers’ intentions. For example, the global terrorism system might be used by the terrorists instead. They might intentionally avoid the areas that are concluded as the most common places to be attacked to avoid the intense force of the police.

##### 1.2 What is the problem?

> The threat from terrorism remains high and could worsen over the decade. There are now more Islamist extremists from more countries active in more places than ever before. Extremists will continue to exploit fragile and violence-prone states, including in Southeast Asia. Globally, terrorism will add to instability and drive international security interventions, especially in the Middle East and Africa. According to an online summary of terrorism, over the past decade terrorism killed an average of 21,000 people each year. In 2017, terrorism is responsible for 0.05% of global death. In addition, the problem of terrorism is so complex because different cultures and ideologies define terrorism in various ways, and incidents happen in different ways with different types of weapons that people have no time reacting. These facts are striking to the world suggesting that it is the problem that we humans should be aware of and take initiatives.

##### 1.3 Why does it matter?

> The global problem of terrorism threatens not only the national security of a country, the well-being of a society, but most importantly, the security of citizens’ property and the safety of their lives. So many innocent lives were lost because of terrorist attacks throughout human history. Terrorism also has a great impact on international relations. After 9/11, the US government has unprecedentedly increased attention and actions towards terrorism because thousands of people were injured and killed during the attack. The terrorist organization had declared to kill Americans because of the US’s previous support to their opponents, which countered their interests. After two decades, the complexity of terrorism can only increase given the current perplexing international relations in regions, such as the Middle East. Therefore, the issue is a global issue, which matters to all citizens who embrace the peace and well-being of the world. More specifically, international organizations such as the United Nations, have greater concerns about the issue.

##### 1.4 How will it be addressed?

> We plan to analyze global terrorism issues on a global scale. Specifically, we will address the possible correlation between countries, casualty, and types of attacks and weapons used. We will discuss how are terrorism related to each variable, how they affect each other, and eventually draw conclusions from our data visualization. We will present our result utilizing the knowledge we learned in class about data manipulation and visualization.
<br><br>
> First, we picked out the columns that we found useful for our research from the original dataset. The columns we picked are year, country, region_txt, city, latitude, longitude, number_killed, number_injured, targtype1_txt, attack_type, weapon_type, and success, because they are relevant to our question and report. Since we have more than 190 thousand of observations in dataset, we decided filter out all failed cases and all cases with no casualty. In addition, the old data of terrorism of the last century cannot perfectly apply to the situation today, so we chose to use the data from 2000 to 2018. We ignored all the NA value because it is impossible to study them with the uncertainty.

### 2.0 Research questions

> Through our initial research, we noticed that the motives and types of weapon used have potential impacts on the casualty of terrorist attacks. Weapon types in this case are most crucial for understanding the number of casualties in the terrorist attacks.  Therefore, our group would like to discover **_what is the potential correlations among weapons types, casualty numbers, successful rate, and regions over the last twenty years?_** If the results do turn out to be some kind of correlation among the variables, then our data analysis and visualization would be significantly helpful for government officials to gain insights about different types of terrorist attacks and hopefully to take action before any attacks occur, preventing the harm of certain weapons in certain regions to minimize the casualties.

### 3.0 The data set(s)
Who created it?
> National Consortium for the Study on Terrorism and Responses to Terrorism. The primary researchers  are Erin Willer, Gary LaFree, Laura Dugan.

Why was it created?

> The researchers in the national consortium dedicated to improving the understanding of the human causes and consequences of terrorism.

Where did you access it?
> We access the data online on the official website of the Global Terrorism Database.

What represents an “observation”?
> Every terrorist event happened from 2000 to 2018 counts as an observation in our data.

What “variables” does each observation have?
> Each observation has 12 variables. These variables are year, country, region, city, latitude, longitude, number of people killed, number of people injured, target type in number, attack type, weapon type, success or not.

How big is the data set? If it is a subset of a larger data set, how was the sub-set created?
> The original dataset has 191,465 observations and 12 variables. We filtered out some unrelated variables and observations to form a new subset data.

If the data set represents people, who has been included and who has been excluded?

> Our data includes people who were physically affected by the terrorists, but not mentally harmed.

Using Envisioning Cards

> The strength of our dataset is that it is pervasive in a way that it is a global data sets. The data set does not only focus on one country that was affected by terrorist attacks but all of them. This dataset not only “cross national boundaries” but also can be “widespread use”.
However, in this dataset we do not have the number of children that were affected by the attacks. Therefore, we are not able to analyse the impact of the attacks on kids. This makes us hard to think about how the attacks would affect kids in their future life. (Considering Children)


### 4.0 Information visualizations

> We created a visualized map showing the total number of casualties in each location of the event happened based on the latitude and longitude given in the data set. This is just one of many visualization maps that we will do for this project. This gives us an overview of where the terrorist attacks happen in each year. The users can also see the number of casualties in different areas from 2000 to 2018. By switching the map between different years, the audience can easily see the trend of how the total number of casualties change throughout the years.

### 5.0 Technical description of Shiny application
> We loaded our dataset as a csv. file. The major libraries we used are shiny, leaflet, and dplyr.  
<br><br>
For our project, we have all the propsoals and readme files directly in the project repo filder. The shiny application was organzied in another folder under the project repo. Under the shiny folder, there is a folder called data that contain the dataset we're using for this project. We choose to organize in this manner since it allows us to easily navigate through the file directory.
<br><br>
A few basic questions that we plan to answer with statistical analysis are: How many terrorism attacks happened each year in 21st century? What is the trend of total number of terrorism for the 21st century? What is the number of total casualty caused by terrorism attacks each year in 21st century? What is the trend of total number of casualty for the 21st century?

### 6.0 Conclusion
> We hope that we could find some correlations between the weapon types, casualty numbers, and regions as we stated in our research questions.

> We think that our strength of the project is to potentially fill in some gaps in the research on global terrorism.

> The weakness might be that it is hard to measure the damage of each terrorist attack as it not only causes physical damages, but also be mentally harmful for certain people.

### Acknowledgments
> Thanks David and Vineeth for helping our group and giving us advices along the way!

### References
[Topics in Terrorism Research](https://www.tandfonline.com/doi/full/10.1080/17539153.2019.1579777)

[Terrorism will remain critical global threat](https://www.fpwhitepaper.gov.au/foreign-policy-white-paper/chapter-two-contested-world/terrorism-will-remain-critical-global-threat)

### Appendix 1: Data Dictionary
[Data Dictionary](https://docs.google.com/document/d/1Ww8AY9lXRsU5O7kV1578dJzdunShMc-FiaoqgELgqOI/edit?usp=sharing)


### Appendix 2: Reflections
Jerry Wang
> Initially, we tried to come up with a research problem first, and then find the datasets that solve it. This approach frustrates us a lot due to the complexity and large number of datasets online, so we decided to find datasets that is easy to work with first, then ask questions about the datasets. I developed a lot as an innovator and a coder. The interactive map in shiny improved my skill with R. I learned the importance of creative thinking and reflecting through brainstorming research questions and writing proposals. I hope I can continue to improve and use these findings in my future works.

Clover Li

>I learned about team collaboration through this project. It is important for everyone to do what they are good at so that everyone can work most effectively. Additionally, communication is the key. For example, in this project, we both focused on the part of the projects that we think we are good at. We also talked to each other throughout the whole time to solve problems that may occur or some confusions. This time I focused on the report part of the project. In the future of the project, I think I will put more effort into the technical part which is  like building the website and writing the code. We also used envisioning cards for a lot of times when we were thinking about our data. The cards really help me to think from different perspectives which made me become a good thinker and innovator. For a better coder, I think I will develop it next time.

Xinye Li

> Our group project has been overwhelming yet enlightening so far: as a student majoring in Communication and International Studies, I had to take extra steps in order to make sense of Shiny, as well as its structure. Through this part of the project, not only did I learn a lot about the capabilities of the Shiny framework, but I was also equipped with concrete knowledge of creating, configuring, and structuring a Shiny application from scratch. The collaborative environment also taught me to understand my teammates’ strengths and weaknesses and to be open-minded with new ideas, and be flexible with my schedule. Since our topic is global terrorism, the project has given me a valuable opportunity to explore and research an area that I had no previous knowledge about. Now, I am able to work with data and transform them into insightful information with more confidence. The project has definitely pushed me to develop my coding skills and critical thinking.

Yichi Zhang

> From this project, the most important thing I have learned is the importance of communication when working within a team. To me a good teamplayer, I realized I have the responsiblility to constanly update my working progress, provide suggestion, and faciliate communiation when working with my teammate. Also, I learned that time management is crucial in order to deliver the project on time. For our project, we did not have any specfiic deadline about what should be done and as the result some of the work was done in last minute with rush. Thus, next time i will make a plan about what should be done at what time right at the beginning of a project in order to avoid situation like this.

### Appendix 3: Use of Envisioning Cards

> Overall, when we selecting the original data set, we were using the envisioning cards to help us to be more open minded and include more variables. In doing so, we believe we can have more valuable and insightful conclusion about our research questions.
