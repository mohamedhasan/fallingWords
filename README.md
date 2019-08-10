# Babbel iOS task

##Picked Solution:
Falling words

##Project Design
![Project Design](https://user-images.githubusercontent.com/4721781/62821557-150a2700-bb77-11e9-8824-4b96e32523c9.jpeg)


##Time Invested

-Concept and design : 30 mins
-Project structure: 30 mins
-UI : 1.5 hours
-Models and loading data : 1 hour
-Game experience and logic : 4 hours
-Unit testing : 1 hour

## >>>> Total Time : 8.5 hours including adding unit tests and extra feature of switching language, and searching online for some assets.


## Descisons made based on time :
-Simple user answer selection using buttons.
-Selection small datasets with static size(20) to gain easier random questions picking mechanism.
-Put English and Spanish as the only two language supported.
-Adding a label for how many words remaining.


## What would be improved :
-Better questions selection mechanism, with reasonable correct/wrong translations probabilities.
-Having a dynamic way to detect source and destenation languages
-Adding Levels(Complexity) to the game, with more falling speed and less time.... etc.
-Adding a better user experience for choosing answer like dragging or using accelerometer.
-Pausing the game.


## Some personal decisions
-Mapping language data into normal array:
I chose to map into normal arrays to directly and make use of raw String arrays, insterad of looking up answers in tuples or objects, it will be faster to have a predefined set of data for lookup.
###Cons:
more memory used, but for my current solution (20 items) and time available I made that desicion.
for more complex game a better search solution can be implemented.






