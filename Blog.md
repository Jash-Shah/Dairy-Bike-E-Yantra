Dairy Bike: A Self Balanced Ride to Victory
==============================
***A delicate LQR Balacing Act***

***A dream of Cows and Controllers***

***A Two-Wheeled Self Balanced Ride to Victory***

## What is E-Yantra?
[e-Yantra](https://new.e-yantra.org/) is a robotics outreach program funded by the Ministry of Education and hosted at IIT Bombay. Every year among the many international events and competitions organized by e-Yantra, the [e-Yanta Robotics Competition(eYRC)](https://portal.e-yantra.org/) is arguably the most prestigious.(How do we know it's the most prestgioius? Well...because its the first thing they list in the *Initiatives* section on their website :blush: ). eYRC 2021-22 was conducted completely online in a period of 6 months. The [Themes(problem-statements)](https://portal.e-yantra.org/themeIntro) during our eYRC were all related to technologies around **agriculture**.

## Why did we participate?
All four of us are active members of the [Society of Robotics and Automation, VJTI](https://sravjti.in)(SRA) and had just come fresh off of a month long mentorship program under SRA Seniors where we had each worked on our first "Robotics" project.

Ayush had implemented a [Bin-Packing Algorithm in Coppelia-Sim](https://github.com/sagarchotalia/Pick-and-Place-Robot-Eklavya)(remember this!), Aryaman had implemented [self-balancing and line-following algorithms using PID on a two wheeled bot](https://github.com/Aryaman22102002/Wall-e-simulation-ros2) in simulation, Jash had simulated and wrote the control system for a [Drone simulation](https://github.com/Jash-Shah/Eklavya---Drone) and Anirudda had performed [Gait analysis using a Quadruped in ROS/Gazebo](https://github.com/Aniruddha1261/Quadruped-gait-analysis-ros).

Hence, we were just innocent new-comers into this daunting world of robotics, and after our first semi-succesful endeavours we were motivated by our seniors to participate in eYRC as the next natural step.

Being the naive, starry-eyed budding engineers we were, we registered and paid the entry fee for this apparent 6-month long International Robotics competition organized by IIT Bombay with little to no foresight on how much it would affect our upcoming months.

### How was the team formed?
We wish we had a story of some long lost brotherly bond here, but we don't. The teams were formed randomly among interested people from SRA. And we just happended to be clubbed together, not having worked with or even spoken to each other prior to embarking on a 6-month long endeavour together. :sweat_smile: 

## Theme Allotment
After the regisration process, where we are asked an array of questions about our past experiecne, areas of expertise, past projects, our interest and also what kind of specs our PCs have(believe it or not this is probably the deciding factor in us being alloted our theme). After some analysis, we recieved the mail stating that we were selected for eYRC and the Theme alotted to us was [**Dairy Bike**](https://www.youtube.com/watch?v=nqLIMNnJdnw). 

<iframe width="560" height="315" src="https://www.youtube.com/embed/nqLIMNnJdnw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Dairy Bike invovled building a Two Wheeled Self Balancing Robot, which loads/unloads products from a dairy farm to their designated destinations. This entire mechanism along with the robot had to be built from scratch and simulated in [CoppeliaSim](https://www.coppeliarobotics.com/).

It shouldn't be too tough to imagine the fear and uncertaintity we felt when we read the theme description again and again and the realization of how much work this might require started to creep in.

We were invited to our eYRC Theme forums where we could interact with our Theme mentors and the other teams(ofcourse not sharing resources or code).

## And let the Tasks begin......
![Dairy Bike Banner](https://user-images.githubusercontent.com/82901720/163624246-4ebdd65d-223c-4912-bcf3-a0d0ee79ed60.png)

### Task 1: Control Systems Galore!
[The first task](https://github.com/Jash-Shah/Dairy-Bike-E-Yantra/blob/main/Theme_Related_Information/Task1-combined.pdf) was divided into three substasks:

- **Task 1.1** required us to first go through theory about modelling of non-linear dynamic systems. It taught us about non-linear system of equations, state variables, state equations and methods to calculate Jacobian of a matrix, what are stable and unstable equilibrium points and how to determine them, etc. The [Control Bootcamp by Steve Bruton](https://youtube.com/playlist?list=PLMrJAkhIeNNR20Mz-VpzgfQs5zrYi085m) on Youtube is by far the best resource for this. It also required us to get familiar with using Octave for which we used the [Octave docs](https://octave.org/doc/v7.1.0/).

- **Task 1.2**, started with us reading about the mathematical modelling of a system using Euler-Lagrange method. Further, we got acquainted with state-space analysis, pole placement method and Linear Quadratic Regulator(LQR). For this task, we had to write [Octave code](https://github.com/Jash-Shah/Dairy-Bike-E-Yantra/tree/main/Task_1/Task_1_2) for implementing pole placement controller and LQR controller on 5 different physical systems.

<img src="https://i.imgur.com/4jnjbzS.png" alt="Inverted Pendulum Diagram" width="400">



- **Task 1.3** required us to get familiar with the very basics of Coppeliasim. We referred to some [YouTube videos](https://youtube.com/playlist?list=PLjzuoBhdtaXOoqkJUqhYQletLLnJP8vjZ) and the [Coppeliasim user manual](https://www.coppeliarobotics.com/helpFiles/) for this purpose. The main kicker in this task was having to learn the Lua programming language, which at the time(CoppeliaSim v4.2) was the default(and only!) language available in CoppeliaSim. We had to write code for an LQR control strategy to balance an inverted pendulum at its unstable equilibrium point using a reaction wheel. Here, we first designed the mathematical model of the inverted pendulum in Octave and got the value of the **K matrix** which is essential for the stability of the bike. Then, using that K matrix, we wrote code for balancing the inverted pendulum in Coppeliasim using LQR.



### Task 2: Balancing == Math == Code
Again Task 2 was divided into tasks 2.1 and 2.2.

- **Task 2.1** was all about the *designing*. All we were given was a lonely model with just the reaction wheel, the two wheels of the bike and a *whole ton* of design restrictions.
    ![Task 2.1 Given Design](https://i.imgur.com/INLSO3H.png)

    The only tools at our disposal for filling the void between the two wheels, were the primitive shapes and even more primitive manipulation tools that CoppeliaSim provided us. Also, four engineering students who had forgotten about their creative sides :pensive:. 
    
    To save you the trouble of explaining the unjustifiable choices behind some of these designs, here is a collage of all our creative powers put together:

    ![](https://i.imgur.com/3PWiMds.jpg)
    
    And as with any project, none of these designs were actually used in the final version of the Bike. Although elements of each can be found in the final bike!
    
    We calculated the Moment of Inertia and Centre of gravity of the bike and then ensured that the reaction wheel must be placed exactly exactly above the Centre of gravity of the bike.  Also, we ensured that the reaction wheel was not placed too low on the bike, as it would've required a very high torque to balance the bike if the reaction wheel was placed low. 

- For **Task 2.2**, we had to design the mathematical model for our dairy bike and explain each and every major step in detail in a [PDF](https://github.com/Jash-Shah/Dairy-Bike-E-Yantra/blob/main/Task_2/Team2338_Task2.2.pdf). Since, the dairy bike can be considered as an Inverted Pendulum Problem, we sifted through a lot of research papers for this step. Finally we settled on one published in [Kybernetika](https://dml.cz/bitstream/handle/10338.dmlcz/144208/Kybernetika_51-2015-1_12.pdf), as it most aligned with our goals.

### Task 3: Our First Major Date with Coppelia
While Task 2 introduced us to CoppeliaSim, it was Task 3 where we really got to dive deep into its Simulation Software and the [CoppeliaSim Regular API](https://www.coppeliarobotics.com/helpFiles/en/apiFunctions.htm).
Our main challenges with this task were:
1. **To implement the self-balancing code on our bike that we had previously written in Octave.**
    
    Our first sub-task at hand was to obtain the state variables of the dynamic model of bike the simulation scene. Extracting the state variables which were angles and angular velocity proved to be a bit challenging as the angles depended on frame of reference with respect to which they were measured and we werent that familiar with CoppeliaSim API functions required just yet.
    
    <iframe src="https://drive.google.com/file/d/1ijfG2sWlu895sZ3t0vdje_tlFqiayv1l/preview" width="170" height=160" allow="autoplay"></iframe>
    <iframe src="https://drive.google.com/file/d/1rLbFSKVYTDhjJbKIsurZ290xZPMnZgP9/preview" width="170" height="160" allow="autoplay"></iframe>
    <iframe src="https://drive.google.com/file/d/1Rvw0Fkg2uumYE5Nes8STtgI-bKDbPagb/preview" width="180" height="160" allow="autoplay"></iframe>
    
    In the end good ol Pythagoras theorem with bit of math came to our rescue:smile:
    
    Setting up the controller which would give the response torque to bike for balancing was easy as we had already calculated the K matrix of LQR earlier.
    
2. **To learn about path points and how to make our bike traverse a path in Coppelia.**
    
    By refering the API funcions used in a [example bike in CoppeliaSim](https://www.youtube.com/watch?v=77zfsI__hbA) that was performing a similar path-following, we were able to do same for our bike with relative ease.
    
    <iframe src="https://drive.google.com/file/d/1oSxsRGbUkO74iwDg3PpoGIxVF0w44ZU3/preview" width="640" height="480" allow="autoplay"></iframe>
    
3. **To ensure that the self-balancing works on different kinds of terrain.**
    
    3.1 **8-Shaped Road**
    
    <iframe src="https://drive.google.com/file/d/1oQWU9QJ0J2arD4c-X3T2MTcAmQOBSQGG/preview" width="640" height="480" allow="autoplay"></iframe>
    
    3.2 **Straight Bridge**
    
    This task was one of the more difficult ones as we struggled on getting the angles for our bike for quite a while.
    
    <iframe src="https://drive.google.com/file/d/13O_AyEeoKnJniRp3EzUVnQBkW0r_p8Tj/preview" width="640" height="480" allow="autoplay"></iframe>
    
    What made it exponentially more stressful, was the fact the submission deadline was **during out third semester exams!!**. Getting through this phase is something that required dedication and contribution from each of us but somehow we managed to make a submission!
    This taught us to not give up and persevere as were working on this even till two days before our college exams started :sweat_smile:
    
    3.3 **Curved Bridge**

    <iframe src="https://drive.google.com/file/d/1crkyuTJeOjvjb3YBqNGzMUZjjn-c7rOD/preview" width="640" height="480" allow="autoplay"></iframe>
    
     

### Task 4: The ARM Olympics/Build the Limb/ Feeling of having 0-DOFs

In Task 4 we had to use/design a Robot Arm to perform the pick and place of dairy products. Unfortunately due to design constraints of our bike we couldnt use most arms given in Coppeliasim model library and those which were usable, we found that it would be difficult to modify their already written controller code to suit our use. So in the end we made our own simple 3-DOF arm. However nothing is simple when you design things from scratch, we had to go over multiple design iterations and writing our own code that controls the arm to get things working. The code implemented inverse kinematics which worked for this task as there were few objects but the armbehaviour was not accurate enough, which lead to some problems you shall see in Task 5. The second part of task 4 involved taking a right turn at T-junction. This was a bit of challenge as until now our bike had to follow the path which had only one direction, this was solved by a bit of ingineuity by using and writing code for two extra path follower objects one for each left and right turn.

### Task 5: The Arena!!/ The Cow comes to Life

### Pre-Finale: Making a Black Box

## The Finale Experience/ The Finale
### Shooting our Cow/ Making the Video
### The Panel Interview Experience

## Key Takeaways

---
---
---
===============================================

### Approach
- Lets not try to be too technical.
- Keep it informal and funny too
- Add illustrations, diagrams, flowcharts, images, videos, gifs instead of code and formulas wherver possible.
- Add as many refernce links as possible.
### Basic topics to cover. Add/remove as you like

- Why we participated?
- Who motivated us?
- What were our expectations upon participating
- What prior knowledge we had
- Registration process
- How was the team formed
- Introduce each member
    - Aniruddha Thakre
    - Ayush Kaura : CS SY, Prior to this I had done one project, that was simulation of Bin Packing in Simulation under Eklavya Mentorship Program and I had attended SRA workshops.
    - Aryaman Shardul : CS SY, Prior to this I had done two projects. The first one was implementing an obstacle avoidance algorithm on a differential drive robot and simulating it in gazebo. The other one was designing a two wheeled robot, implementing and simulating self-balancing and line-following algorithms on it using a PID controller.  
    - Jash Shah
- Describe each task
    - Difficulties faced
    - Initial ideas
    - How did we coordinate
        - Ayush: We co-ordinated mainly via a WhatsApp Group and also a Discord Server dedicated for this purpose, where we had regular discussions and collaboration on particular topic like writing code for particular functionality or designing some aspect of simulation could be easily done using discord voice channel.
        - Aryaman: Also, we maintained a document to list all the issues with our bike, their relative order of importance to be solved and their possible solutions.
    - who did what
    - Technical Issues we faced
    - What we learnt - not only technical but also stuff like teamwork, not giving up, etc.
    - How couldve it been done better
        - Ayush: Personally speaking I felt that due to an inherent design flaw in our bike design with containers placed higher than other team's design, was the main reason for restricting how fast our bike could go which hindered our score compared to other teams and some other design decisions and related to our LQR controller could have been improved if one looks to achieve real life robustness. That was mainly regd the technical aspect. It is important to do the intial tasks well, even if they seem boring conceptual tasks as they determine how many problems you will have to resolve later on.
        - Aryaman: I agree with Ayush regarding the flaw in the design. Regarding the things we learnt during the 6-7 months of eyrc, On the technical side, we came to know and learned about mathematical modelling, Linear Quadratic Regulator(LQR), State-Space Modelling, Euler-Lagrange Mechanics and languages like Lua and Octave. We also learned to work with V-REP simulator. On the non technical side, the first and foremost thing that we learned was co-ordination i.e how to efficiently function as a team under strict deadlines. Also, there were times where the deadline was almost near and we were stuck on a particular problem during the task. During such situations, although we felt that we might not make it, we never gave up and kept on trying to complete the tasks and eventually completed them. 
    - What was the atmosphere like on the forums
    - Reaction of mentors
        - Ayush: Communication with Mentors is important. Like after Task 2 or 3, our theme mentors used to have open discussion sessions in days leading up to the task submission. Attending these sessions benefited us, the mentors didn't solve the problem for us per se but gave us ideas in the right direction for the things we were stuck on. Even if such sessions are not held, communicating on the discourse with issues you have should be done. Mentors may not provide the exact solution but most of the time you will get an answer from them guiding you with the problem you are facing (hopefully on time xD).
        - Aryaman: Also, sometimes, there might be some experienced participants on the discourse who will try to solve doubts of other teams indirectly. So, do keep an eye out for them and see if their answers on the discourse might solve your problem.  
- Reaction to getting selected for finals.
    - Ayush: I was pleased with the 6 months of efforts we had put in as a team paid off. Personally was my goal to atleast complete the theme, getting selected for finals would be a bonus.
    - Aryaman: Intially when the competition started, I didn't expect to make it to the finals. I just wanted to complete the theme and learn something new from it. When we approached the near the end of the competition(near stage 6), only then did I realize that we had a decent chance of getting selected for the finals. I was so happy and relieved when I came to know that we qualified for the finals.
- How did we prep for finals
- Finals interview prep and actual interview descp
- Post-finals expectation.
- Reaction of 3rd place
    - Ayush: Our results were announced in a Zoom Meet. They announced our results in reverse order. Each time they announced result for 6th,5th,4th place I was expecting our name to be called out. But eventually I was suprised and relived at the same time that we came third culminating our long journey of 6 months on a positive note.
    - Aryaman: For the final interview, we prepared a list of questions that we expected could be asked to us. We divided those questions among ourselves and revised our theory based on those questions. When they announced the winners in a meet, I didn't expect to be in the top 3. But when I actually came to know that we secured the 3rd place, my boundaires of excitement and joy had no limits. It was a great feeling of happiness and satisfaction that our hardwork finally paid off. 
- Looking back at what we learnt, what couldve been done better.
- Internship prep and interview descp
    - Aryaman: The thing that I would redo would be to re-design the bike with the containers placed a little lower as pointed out by Ayush earlier. 
 
- Final thoughts about the whole experience 
    - Aryaman: I highly encourage students interested in robotics to participate in eyantra as it is great way to learn new concepts and gain some practical experience by implementing them. It also inculcates in us the competitive spirit as it is a national competition with a huge number of participanting with even a small number of international teams participating in it this year.  I had great a time with my team mates during the entire course of 6 to 7 months learning and implementing new things, having fun and working till late night or should I say early morning :) . I am really looking forward to work with them on more projects in the upcoming future.
  
