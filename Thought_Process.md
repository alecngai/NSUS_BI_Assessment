First Principles Thought Process

- Clarifying your thinking and explaining the origins of your ideas (Why do I think this? What exactly do I think?)
- Challenging assumptions (How do I know this is true? What if I thought the opposite?)
- Looking for evidence (How can I back this up? What are the sources?)
- Considering alternative perspectives (What might others think? How do I know I am correct?)
- Examining consequences and implications (What if I am wrong? What are the consequences if I am?)
- Questioning the original questions (Why did I think that? Was I correct? What conclusions can I draw from the reasoning process?)

a. What tables would you expect to be populated?

- Clarifying your thinking and explaining the origins of your ideas (Why do I think this? What exactly do I think?)

I first focused on infomation that was shown on Pokercraft, I broke it down into multiple tables, first was Session History, Game History and Hand History in that order. I also added two tables that were complementary Players, and Finance, these tables are more broad, and I assumed the database ran on a hierarchical database structure. 

I believed the best way to answer this question is to create an ERD (Entity Relationship Diagram) schema, this will allow the viewer to quickly understand the structure of the database structure I have envinsioned. Using QuickDBD, I wrote sql code to show the creation of the database and the relationship between the tables with private and foreign keys. 

1) I recognized that I did not portray the full picture and made some assumptions for the sake of the time constraint of the assessment. First assumption was for different game modes, this is because GGPoker has so many differnt gamemodes, blackjack, poker, shortdeck, spin and gold, etc each with slight variations each generate new columns of data. If there was a master table for every game, and there was no specific table per gamemode, that would mean the master table stores lots of null or empty columns for each specific game mode, this is an inefficent way of storing data, and would waste alot of storage, therefore I assumed there should be seperate tables per gamemode that have significant difference in variation and data stored.  

2) Another assumption for Finance table is that there should be many more tables, but I combined it into one main table for simplicity sake, there is many different functions, deposit, withdrawal, p2p, staking, etc, however to explain my thought process for the later questions regarding the UK questions 4, and 5. Every transaction will also be logged, gameplay, insurance, buy-in, etc. 

3) In addition, for Hand History, I assumed the hand interactions to just be string, however there could be a sub-table to store the values of the gameplay, For each 'event' (flop, turn, river) players will have an action, (bet, check, fold, raise) which isn't captured here.

- Clarifying your thinking and explaining the origins of your ideas (Why do I think this? What exactly do I think?)

1) I thought this assumptions because of the data processing efficency would suffer greatly, for everytime we add a new gamemode, the entire master table would had to have another column added to it, making it multiple of x greater, in terms of data storage and big O notation for data processing, as this would add another column to process 

2) I have access to core, and can clearly see there is much more data stored than I have shown, I have just simplified it for the sake of the assessment, but have an understanding that there is much more tables and data stored for the financial side of GGPoker. I also know there is an audit log of movement on players account, however, to reduce the scope I have simplified it. 

3) Similarly for previous point, each hand history has a clear visual aid for the player, I know the data is not stored as a string as it has to be versitile for the visual aid system to quickly show the player the hand history, it would not make sense to process a string with regex each time a player wants to view their hand history. 

- Challenging assumptions (How do I know this is true? What if I thought the opposite?)

1) I based my logic and going through the different gamemodes on pokercraft and saw each session table, game history, and hand history has different columns and structure. Here is a specific example of spin and gold and all in or fold.


![1]()

- Looking for evidence (How can I back this up? What are the sources?)
- Considering alternative perspectives (What might others think? How do I know I am correct?)
- Examining consequences and implications (What if I am wrong? What are the consequences if I am?)
- Questioning the original questions (Why did I think that? Was I correct? What conclusions can I draw from the reasoning process?)

I believe the question was to show my understanding of data structure and schema, as a BI analyst I would need to have a good understanding of how data works in order to translate it into a visual aid for our clients. 
