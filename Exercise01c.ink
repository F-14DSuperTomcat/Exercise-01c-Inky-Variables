/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 Equality: 1 == 1
 Inequality: 1 != 2
 Greater: >
 Less: <
 Greater or equal <=
 Less than or equal =>
 
 In the assignment:
 * Add four more knots
 * Assign at least TWO new variables through player choices
 * Print at least one of the variables to the player in a passage
 * Check the value of a variable and have it do something
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR weapon = ""
VAR courage = 0

-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie] 
~ pet_name = "Charlie"
-> cave_mouth
* [Susan]
~ pet_name = "Susan"
-> cave_mouth
* [Spot]
~ pet_name = "Spot"
-> choose_weapon
-> END
== choose_weapon ==
You spot some items near the entrance. What will you take?
* [sword] 
~ weapon = "sword" 
-> cave_mouth
* [bow]
~ weapon = "bow" 
-> cave_mouth
-> END

== cave_mouth ==
You are at the enterance to a cave. You now have a {weapon}. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now.

You have {torches} torches.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup
-> END
== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
{pet_name == "Spot": Spot would love it here in the west. | }
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room. But there is a monster in your way. Do you press ahead?
* [go to the treasure] -> bat_ambush
-> END

==bat_ambush==
Suddenly, dozens of bats drop from the ceiling and fly at you.
* [defend yourself (will lose 2 health)] -> fight
* [run (will not gain courage)] -> run
-> END

==fight==
~ courage = courage +1
~ health = health -2
You manage to fend off the bats, if only barely. {health} HP remaining
* [ go to the treasure] -> treasure_room_entrance
-> END

== run ==
You run past the bats, and find yourself directly in front of the treasure room.
* [go to treasure] -> treasure_room_entrance
-> END

==treasure_room_entrance==
You hear the roar of a monster that sits just past the entrance of the treasure room.
{courage == 1 : But you feel brave enough to fight it.} {courage == 0: You don't think you have it in you to beat it.}

* [{courage == 1: run in and fight the beast}] -> treasure_room
* [{ courage == 0: escape with your life}] -> end
->END

== end ==
You weren't able to leave with any treasure, but you escaped with your life. Maybe you can get the treasure next time.
-> END

== treasure_room ==
A monster blocks the treasure.
* [{weapon == "sword": swing your sword at it}] -> win
* [{weapon == "bow": shoot your bow at it}] -> escape
-> END

== win ==
You slice the beast up with your sword and defeat it. The gold is all yours!
-> END

== escape ==
Your arrows bounce off the beast's scales, and you lose to the beast, but you just barely manage to escape with your life. Maybe next time you can defeat it.
-> END