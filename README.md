# FinalProject
APCS Fall Semester Final Project 
Project Description:
To create a game modeling a prison escape/breakout. Takes elements of PacMan (into the enemy movement and chase), as well as Silent Hill (the flashlight/visibility) and more.

Directions:
Open the file and run the sketch; you will be brought to the main menu.
Select either "Play Campaign" or "Level Editor" to start having fun.

Directions for the Campaign:
- You can only see for a small distance around you, so you must search for the end of each level (a green patch)
- Move with the arrow keys
- Red rectangles are walls
- Purple rectangles are doors, you can pick up keys to open them (make them disappear)
- Saving Prisoners (running over them) will give you extra lives
- Some Guards move randomly, some follow patterns. Be sure to plan your way through a level if you see the patterns and/or randomness.
- When you beat each level, you will automatically be sent to the next. You can quit to the main menu at any time via the button on the bottom left corner, but unfortunately, since we cannot identify separate users, you cannot save your progress on the campaign.

Directions for the Level Editor:
You will be sent to a screen with walls on all sides and a sidebar with different buttons on it.
The buttons:
Player - set up a player anywhere in the level (there can only be one). Click on "Player", then click wherever you want them to be (this location can be changed)
Wall - initialize a wall in the level. CLick on the point that you wish to be one corner of your wall. Then, move your mouse diagnally to where you want the opposite corner to be. While doing this, the wall will follow your mouse, and when you wish to place the wall, press 'a' on your keyboard
Guard - intitialize a Guard where you click the mouse. If you wish for the guard to patrol randomly, you can just continue selecting other objects from the sidebar and placing them in the level. If you would like to add guard Posts for the guard to walk between, place the guard where you like, then immediately after, click to initialize posts, where you want them to be, as well as in the order you wish for them to be. Posts will show up as white squares

Door - Initialize a door in the same way you would initialize a wall
Key - Point and click to initialize a key after pressing the sidebar
Prisoner - same as Key
Endzone - like player, there can only be one, just point and click to add it where you wish (again, this can be changed)
Undo - press this button to undo anything you don't like about your level. It removes in order of recency (the most recent objects are removed first, including guard posts)
Test - Runs the level in a similar fashion to the campaign level, just without the flashlight. Stop testing using the reset button (this button becomes reset while you are testing), by beating your self created level, or by dying
Save - Saves the level to a file. Click the save button and when brought to the name your level screen, do exactly that. Make sure to type slowly though, or duplicates might get in there
Back - return to the main menu
Load Saved Level - Same screen as save, just attempts to load a level from a file with the submitted name.

Both Save and Load cause errors if the name is taken or does not exits, respectively. (Not program errors, but they stop the user from doing it)

Have fun creating and playing your own levels!!!!

Changelog:

Tuesday January 19 2016:

New Features:
Made the level editor as well as basic controls for establishing walls in the level editor. 
Also introduced the flashlight concept using black rectangles. Flashlight also moves with player. 
New Bugfixes:
Fixed odd color scheme/blocking with the flashlight rectangles, by using fill function. 
Fixed transparency of flashlight, by moving and arranging the players display and move around in the PlayLevel function.
New Bugs:
Game still freezes once we reach the end. 
Goals:
Complete more levels. 

Wednesday January 20 2016:

New Features:
Implemented an image for the player's avatar. 
New Bugfixes: 
Made flashlight radius to a more fair amount as opposed to the miniscule amount of visibility we had before.
New Bugs:
Trying to animate the avatar, so it will swing its legs as it moves, but will have to be put on hold in the interest of further gameplay. 
Goals:
Attempt to save levels. 

Thursday January 21 2016: 

New Features: 
Loading Levels from text files work perfectly now. 
New Bugfixes:
None
New Bugs:
Simply not finished with said test function, and the EndZone class needs to be refined to work better. 
Goals:
Fix test function and refine EndZone class. 

Friday January 22 2016:

New Features:
Level Editor has more options now. 
New Bugfixes:
None
New Bugs:
Still trouble with testing, maybe due to Syntax error or something else. 
More trouble with saving levels and text input. 
Goals:
Get testing and saving to work correctly. 

Saturday January 23 2016:

New Features: 
Images for more avatars available now. 
Refined display functions. 
Writing to files works correctly now. 
Menu display also works fine now. 
New Bugfixes:
Fixed loading files now. 
New bugs:
Still trouble with writing to new files, not sure how to get save new files as well. 
Goals:
Get saving and writing to files to work. 

Sunday January 24 2016:

New Features:
Undo function. Not completely functionable. 
Testing function backbone also started, works alright. 
New Bugfixes:
Testing function works to a point. 
New Bugs:
Undo function poses a large problem, too many bugs to tackle at once. 
Goals:
Finish more levels and undo function. 

Monday January 25 2016:
Undo function completely working.
Saving/Writing to files after editing added.
Loading previously saved files added.
Complete navigation between all pages established.
Bugfixes:
Undo function fixed
Writing to files bug fixed
Unfortunately, the only way to edit a previously existing file is to save all the strings, then writeover the old file by just replacing it with a blank one of the same name.
Bugs: No noticeable bugs at the moment, potentially the fact that one is unable to load one of their previous levels and edit and save it by the same name
Goals:
Relax and Sleep