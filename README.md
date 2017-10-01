#RicharBot
Do you like challenges? Add RicharBot a Telegram group with your friends, so you will know who is the best one getting "cobre" :P

The functionalities are indexed at the **functionalities.rb** file, and implemented in files at the **functionalities** folder, being them called from the **bot.rb** file 

In order to add new functionalities, they have to have a function which is the one in charge to perform the action that must be triggered when the **name of the functionality is written**

All the functions must be executed when the name has the '!' symbol first but cobre.

- Example:
	- cobre must be implemented in a file inside *functionalities*, and this file must be called *cobre.rb*
	- !cobrerank must be implemented in a file inside *functionalities*, and this file must be called *cobrerank.rb*

Until now, there are several functionalities implemented:
- Cobre
	- If the user is the first one for that day at a group, he/she will get points
- Cobrerank
	- It will print the photo of the user who has more points
	- It will also print the ranking of the users with their points
