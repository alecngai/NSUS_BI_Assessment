# NSUS_BI_Assessment

## *Log into your newly created account and explore the software*
**a. What are your first impressions of the software?** <br />

The home screen feels like a newspaper ad section; it's too overwhelming, and since so much data is thrown into the users, I believe most users won't scroll down to even look at the other promotions. 
Should be a filter so players are fed ads for promotions they enjoy, making it more of an enjoyable experience for the user and a more targeted ad experience for the marketing team. 

The main page won't scale to my screen resolution. I cannot extend it or compress its width-wise, this type of static app design is outdated, and many games use vectors to overcome this issue. 

There is still a live chat option. However, no live chat support is available. 

If you click to send a report on the Network Status section, it does nothing except prepare the report, then hangs. They should remove this if it is not functional. 

The app is responsive, and loading into games is quick and efficient. 

**b. What game features and promotions look interesting?**

Daily freebie is a great way to add engagement to the game. 

Pokercraft is a great tool, allowing players to track their progress and be able to view their playstyle.

## *Please share a brief summary detailing your experience, including:*
**a. What was your favourite game? Why?**  <br />
Spin & Gold, All in or Fold

Both of these game modes incorporate two things which I enjoy, the spinning wheel, which makes the user feel like he has the potential to win big, which gives more "value" to the users' buy-in. I prefer to play Hold'em, and all in or fold allows you to have a simplified game, which is a more high risk, but the simplicity will enable it to be played in high-speed rotation. 

Rush and Cash

This allows the user to move between tables, low down time, is a middle ground between spin & gold and all in or fold; these three game types target various players, from superficial thinkers to logical calculators. 

**b. What was your least favourite game? Why?** <br />

Battle Royale

Like with most battle royale games, the time commitment is more extensive. You will have to wait for players and play many rounds; it simulates a tournament which is an excellent concept; however, I enjoy quicker-paced games. 

**c. Were there any surprising or unexpected parts you came across?** <br />

It was surprising how many mechanics are tied into each game mode: leaderboards, jackpots, insurance, fish buffet, bingo, wheel spins, etc. Allowing users to experience a lot of value per game, this type of progression is attuned to clicker games, allowing the user to have some progression. It is a compelling and addictive gameplay loop.   

**d. Were there parts of the experience you found confusing?**

The [ticket section](https://raw.githubusercontent.com/alecngai/NSUS_BI_Assessment/main/Resources/Tickets.png) is not sorted and could be compressed and simplified. When you finish a game and say play again, it does not specify if you are using tickets, *T$*, *C$* or USD. 

Insurance per game mode is different, meaning it's up to the user to be more informed about its use; however, the game makes it very easy for the player to use insurance without explaining it. There should be a checker to quickly illustrate insurance to users the first time they use it. 

## *Your gameplay from Part 1 is stored in our game history database.*
**a. What tables would you expect to be populated?** <br />
Players <br />
Finance <br />
Session History <br />
Game History <br />
Hand History

I believe there are more tables, for example, a finance table dealing with all the players' deposits/withdrawals, NGR, GGR, etc. For the Finance table, I expect some subtables; however, for simplicity, I will only use one table to signify the finance data. 

Another assumption is that there are multiple tables for specific game modes because game modes like Battle Royal require you to "Kill" other players, and this data needs to be stored. It wouldn't make sense to have a master table with a column consisting of nulls if the player never plays battle royale. 



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

### Finance as F

- Player_ID Int FK >- P.Player_ID
- Date Datetime
- Type String
- C$ Float
- T$ Float
- Amount Float
- Balance Float
- Description String
- Transaction_ID String

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

- Hand_ID  String PK
- Session_ID String FK >- S.Session_ID
- Game_start Datetime
- Hole_Card String
- Hand_Value String
- Winner String
- Pot Float
- Winloss Float
- Leaderboard Float
- Insurance Float


### Hand_History as H

- Hand_ID String FK >- G.Hand_ID
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

As the data increases, it comes with the challenge of processing more data. This can be solved by acquiring more instances or data compression. Each comes with its challenges; acquiring more instances is exceptionally costly. While data compression can reduce processing costs, it also questions the integrity of the data that may get compromised with compression. 

Next is data storage; data that is not utilized as frequently can load onto more cold storage servers like RedShift, While you can use Aurora or DynanmoDB for data that needs to be pulled oftentimes.

There is feature engineering, which would allow us to remove unneeded columns or combine multiple columns into one, which will significantly reduce the size of the database. 


## Using the fields you provide in Q1, populate a hypothetical game history table with the results of your $0.25 Spin & Gold from Part 1 of the assessment.
**a. Provide a sample of a few row entries in the table, using the fields you came up with as columns**

![Game_History_EX](https://raw.githubusercontent.com/alecngai/NSUS_BI_Assessment/main/Resources/Fake_Game_History.png)

I used python [code used to generate fake data](https://github.com/alecngai/NSUS_BI_Assessment/blob/main/Creating_Tables.ipynb)
to generate 5000 rows of a fake game history data and stored it in [CSV format](https://github.com/alecngai/NSUS_BI_Assessment/blob/main/Resources/Fake_Game_History.csv). 

Given more time, I would implement a few tweaks, but this shows the rough capabilities.

Game_ID is always unique in this table. <br />
Session_ID can be repeated as some games are played together in one session, depending on the game mode. <br />
Game_Start Should show the time in UTC exactly when the game starts. <br />
Game_duration shows the time round lasted. <br />
Hole_Card is the started cards of the player. <br />
Hand_Value is the value of the player's hand at the end of the flop. <br />
Winner assigns a player who won the pot, and this string can be pulled from the Players table using player ID. <br />
Pot is a float value determining the total amount of money in the pot. <br />
WinLoss shows the players' win-loss value. <br />
Leaderboard_points is the amount of points earned towards leaderboard <br />
Insurance shows insurance won on the hand.  <br />


## In addition to the game history table, what other tables would you expect to see stored on the backend? Please specify the fields along with their data types.
**a. What would be a suitable primary key to relate the various tables?**

Primary Key and Foreign key are listed as [PK and FK](#players-as-p), and the connections are shown on the [ERD diagram above](https://raw.githubusercontent.com/alecngai/NSUS_BI_Assessment/main/Resources/ERD.png). 


## The United Kingdom marketing manager has sent a request to the BI team to set up Tableau dashboards to monitor newly acquired customers.
**a. Which of the tables in Question 3 would you use? // b. Describe the dashboard(s) you would create.**<br /> 

I would use Session_History, Players, and the finance table. 

Our goal is to monitor newly acquired customers; therefore, we need the user's sign-up date, so the players' table is crucial. We also want to look at their gameplay habits and depositing/withdrawal activity, so both Session_history and finance tables are informative. 

Next is the definition of monitoring players,  
The first is to log the total concurrent player base per day and show an area chart below showing fresh players; we can define new players if they have signed up within a couple of days. 
I have chosen within a couple of days since this is a per-day chart. We can also have a filter for players who signed up within the month, the past year or the past year+. This will allow us to see if most of the players currently on the platform are legacy players or newer players. Another filter is a game type; then, we can see what the majority of the player base is playing to understand which game modes are enticing to new players. 

Next is a calculated field of the percent difference per day; this gives the viewer a bit more insight into the ratio of growth or decline of new players per day. 

This can be achieved by using data as a discontinuous feature in Columns, while we have a continuous feature of daily active players and filtered active players in rows.

Daily active players are players who logged in and have at least one gameplay, including staking. 

Percent difference can be a label, and colour can be assigned a filter dimension if the row is active or new. 

The view of this chart will be two area charts overlapping. The back chart will consist of all filtered players, new, one month, etc. The front will show new players as default. Can have percentage change as a line graph, which we will use a dual-axis to overlap the line graph onto each other. 

This dashboard will show the health of the current ecosystem, and we can visually see overall growth and recent growth. 

---

Next is the financial dashboard; we want to visually see if the new customers are depositing/withdrawing and what game modes they are spending their money on. 

This will show how much the users are depositing vs withdrawing per day. Utilizing the finance chart and players, we can find the count of players and the amount they are depositing vs withdrawing and filter by new players, month, year, etc. 

Another filter shows how much of those deposited funds are lost to the house, rake, and fee, so we can track how much money GGPoker earned that day from this market. 

This will give us insight into the rate of players' deposits if our game is engaging and enticing enough for them to want to deposit more. In addition, we can see how much money we are making off the UK market that day, per-user base. 


**c. What metrics would the marketing manager be interested in to evaluate the performance of a marketing campaign to acquire new players?**

## The UK team was elated with your acquisition dashboard and has requested a Life Time Value model to project the value of newly signed up customers.
**a. How would you design such a model?**<br />
**b. What variables would you use?**<br />
**c. How much data would you need to have statistical significance?**