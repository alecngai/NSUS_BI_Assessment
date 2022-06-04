# NSUS_BI_Assessment

## *Log into your newly created account and explore the software*
**a. What are your first impressions of the software?** <br />

The home screen feels like a newspaper ad section, its too overwhelming and too much data thrown into the users, I believe most users wont scroll down to even look at the other promotions. 
Should be a filter so players are fed ads for promotions they enjoy, making it more of an enjoyable experience for the user, and a more targeted ad experience for the marketing team. 

Main page, wont scale to my screen resolution, I cannot extend it or compress it width wise, this type of static app design is outdated and many games use vectors to overcome this issue. 

There is still a live chat option, however, no live chat support is actually available. 

On the Network Status section, if you click send report, it does nothing except prepare report then hangs, they should remove this if it is not functional. 

App is very responsive, loading into games is quick and efficent. 

**b. What game features and promotions look interesting?**

Daily freebie is a great way to add engagement to the game. 

Pokercraft is a great tool, allowing players to track their progress and be able to view their playstyle 

## *Please share a brief summary detailing your experience, including:*
**a. What was your favourite game? Why?**  <br />
Spin & Gold, All in or Fold

Both of these gamemodes imcoprate two things which I enjoy, spinning wheel, which makes the user feel like he has the potential to win big, which gives more "value" to the users buy-in. I personally prefer Hold'em, and all in or fold allows you to have a simplified game, which interms is more high risk, but the simplicity allows it the be played in very fast rotation. 

Rush and Cash

This allows the user to move between tables, low down time, is a middle ground between spin & gold and all in or fold, these three gametypes target a variety of players, from simple thinkers, to logical calculators. 

**b. What was your least favourite game? Why?** <br />

Battle Royale

Like with most battle royale games, the time comitment is larger, meaning you will have to wait for players, and play a multitude of rounds, it simulates a tournament which is a cool concept, however, I personally enjoy more quicker paced games. 


**c. Were there any surprising or unexpected parts you came across?** <br />

Was surprising how many mechanics are tide into each game mode: leaderboards, jackpots, insurance, fish buffet, bingo, wheel spins, etc. Allowing users to experience alot of value per game, this type of progression is atune to clicker games, which keep allowing user to have some sort of progression, and is an affective and addictive gameplay loop.  

**d. Were there parts of the experience you found confusing?**

The ticket section is not sorted, and could be compressed and simplified. When you finish a game, and it says play again, it does not specify if you are using tickets, T$, C$ or USD. 

Insurance per gamemode is different, meaning its up to the user to be more informed onto its use, however, the game makes it very easy for the player to use insurance without explaining it, there should be a checker to quickly explain insurance to users the first time they use it. 

## *Your gameplay from Part 1 is stored in our game history database.*
**a. What tables would you expect to be populated?** <br />
Players <br />
Session History <br />
Game History <br />
Hand History

I believe there are more tables for example, a finance table dealing with all the players deposits/withdrawals, NGR, GGR, Etc, but for simplicity I will focus on game history. 

Another assumption is there are multiple tables, for certain gamemodes, this is because gamemodes like Batttle Royal recquire you to "Kill" other players, and this data needs to be stored. It wouldn't make sense to have an master table with a column consisting of nulls if the player never plays battle royale. 

**b. What fields would you expect to see in this table? / c. Please also include the data type of each field.**
<br />

![ERD](https://raw.githubusercontent.com/alecngai/NSUS_BI_Assessment/main/Resources/ERD.png)

Here is the attached [SQL File](https://github.com/alecngai/NSUS_BI_Assessment/blob/main/Tables.sql) for the tables that will be populated 

### Players as P

- Player_ID PK Int 
- Email_Address String 
- Mobile_Number String
- Username String
- Nickname String
- Agent String
- Site String
- Country String
- Sign-up_Date Datetime
- Last_Game_Play_Date Datetime
- Account_Status String
- KYC_Status String
- Tags String
- Maker String

### Session_History as S

- Session_ID PK Int
- Player_ID int FK >- P.Player_ID
- Session_start Datetime
- Session_end Datetime
- Blinds String
- Table String
- Type String
- Hands Int
- Duration Datetime
- Winloss Float
- Balance Float
- Amount Float
- Total_Rake Float
- Total_Fee Float

### Game_History as G

- Game_ID  String PK
- Session_ID String FK >- S.Session_ID
- Game_start Datetime
- Hole_Card String
- Hand_Value String
- Winner String
- Pot Float
- Winloss Float
- Insurance Float


### Hand_History as H

- Hand_ID String PK
- Game_ID String FK >- G.Game_ID
- Hand_start Datetime
- Hand_end Datetime
- Hero_ID Int FK >- P.Player_ID
- Opponent_1_ID Int FK >- P.Player_ID
- Opponent_2_ID Int FK >- P.Player_ID
- Opponent_3_ID Int FK >- P.Player_ID
- Opponent_4_ID Int FK >- P.Player_ID
- Opponent_5_ID Int FK >- P.Player_ID
- Stack_Amount_Hero Float
- Stack_Amount_1 Float
- Stack_Amount_2 Float
- Stack_Amount_3 Float
- Stack_Amount_4 Float
- Stack_Amount_5 Float
- Small_blind Int FK >- P.Player_ID
- Big_blind Int FK >- P.Player_ID
- Hole_Cards String
- Hand Value String
- Pre_Flop_Action String
- Flop_Action String
- Turn_Action String
- River_Action String
- Showdown_Action String
- Summary String
- Total_pot Float
- Rake Float
- Fee Float
- Jackpot Float
- Bingo Float
- Board String
- All-in-Ev Float
- Winloss Float
- Insurance Float


**d. What are some challenges you might expect over time as the # of rows increase exponentially**

As the data increases, it comes with the challenge of processing more data. This can be solved with acquiring more instances, or data compression. Each comes with its own challanges, acquiring more instances is extremely costly, while as data compression can reduce processing cost, it also comes into question the integrity of the data may get compormised with compression. 

Next is data storage, for data that is not used as frequenct can load onto more cold storage servers like RedShift, While you can use Auora or DynanmoDB for data that needs to be pulled frequently.

there is feature engineering, which would allow us to remove uneeded columns, or combine multiple columns into one, which will greatly reduce the size of the database. 


## Using the fields you provide in Q1, populate a hypothetical game history table with the results of your $0.25 Spin & Gold from Part 1 of the assessment.
**a. Provide a sample of a few row entries in the table, using the fields you came up with as columns**

![Game_History_EX](https://raw.githubusercontent.com/alecngai/NSUS_BI_Assessment/main/Resources/Fake_Game_History.png)

I used python [code used to generate fake data](https://github.com/alecngai/NSUS_BI_Assessment/blob/main/Creating_Tables.ipynb)
to generate 5000 rows of a fake game history data and stored it in [CSV format](https://github.com/alecngai/NSUS_BI_Assessment/blob/main/Resources/Fake_Game_History.csv). 

Given more time there is a few tweaks I would implement, but this just shows the rough capabilities.

## In addition to the game history table, what other tables would you expect to see stored on the backend? Please specify the fields along with their data types.
**a. What would be a suitable primary key to relate the various tables?**

## The United Kingdom marketing manager has sent a request to the BI team to set up Tableau dashboards to monitor newly acquired customers.
**a. Which of the tables in Question 3 would you use?** <br />
**b. Describe the dashboard(s) you would create.**<br />
**c. What metrics would the marketing manager be interested in to evaluate the performance of a marketing campaign to acquire new players?**

## The UK team was elated with your acquisition dashboard and has requested a Life Time Value model to project the value of newly signed up customers.
**a. How would you design such a model?**<br />
**b. What variables would you use?**<br />
**c. How much data would you need to have statistical significance?**