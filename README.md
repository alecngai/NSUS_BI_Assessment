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

For Hand History, I assumed the hand interactions to just be string, however there could be a sub-table to store the values of the gameplay, For each 'event' (flop, turn, river) players will have an action, (bet, check, fold, raise) which isn't captured here.

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

For BI Analyst the main concern is load time/preforamnce, we will have to discuss with the data engineer/architecture to keep in line the demands of the BI team with the structure of the data pipeline. One main way is to cover which data is crucical and critical to the workflow and build upon those data demands. 


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

---

Customer retention over months since first deposit 

We can look at drop off of customers which we can define having zero interaction or gameplay for a certain period. over months to get an quick understanding of the churn in the UK market. 

This way when we introduce new elements we can see if it affects the churn.


**c. What metrics would the marketing manager be interested in to evaluate the performance of a marketing campaign to acquire new players?**

- Monitor progress of business goals, which is to gain market share of that region.
    - % of players (people vs population)
    - % of spend/wallet (*$* vs *$* total)

- Evaluate the ROI of the campaign.

- Cost per Lead, showing us how much it costs us to acquire a new customer, can show the efficiency of the marketing ad.

- Sign-ups using the affiliate code or after the ad campaign has launched. 

- Engagement of the player base, retention.

- Churn of players located in that region to see if churn is affected by the marketing campaign. 

- Customer Lifetime Value, to see if there is an increase due to the campaign

- Brand Awareness, we can see if our social media in that region has grown, or on Reddit can trace the IP of users to see if we have more community engagement after the campaign. 

## The UK team was elated with your acquisition dashboard and has requested a Life Time Value model to project the value of newly signed up customers.
**a. How would you design such a model? // b. What variables would you use?**<br />

Tools: Pandas, Numpy, Matplotlib, Sci-kit

`Customer Lifetime Value` is defined as `revenue over a lifetime`, minus `variable costs` (including `costs of goods sold`), discounted at a `company-specific rate` and did not include `customer acquisition costs`.

Some customer LTV models include `customer acquisition costs`; however, in this case, we will choose to ignore it since our app is global, and each region will end up having its own LTV model, so we will simplify and ignore it for now. If we wish to expand the model, we can go forward and include this in the model. 

The first calculation is `customer lifetime spend` 

- Align all customers by the date of first deposit & first gameplay 
- Exclude customers who don't have enough history 
- Calculate cumulative spending to date over time
- Average across all customers

We will base our model on past data and predict/estimate future data; we will then combine the two sets of data and base our analysis on the complete data set. The reason we exclude customers who don't have enough history is it will skew the model when their lifetime spend is not over, so we will have to do a quick analysis to determine the average lifetime of a customer and exclude customers from this date, for example, any customer who hasn't been playing on GGPoker for more than 2+ year will be excluded. We will use another model to predict their values. A key component is the UK team wishes to look into newly signed up customers.

first, break down the customers into `lifetime`  <br />
-<1 month  <br />
<1-3 months <br />
<4-12 months <br />
<1-2 years <br />
etc 

And from there, you can find how long your players stay in your system. You can find an LTV per player within each age range to know what type of players you want to attract the most. We now have the data of customers and their spending patterns over their lifetime; next is to focus on modelling transaction counts; however, this is difficult because we have a variety of game modes with different methods; we have lost to house, rake, fee, these can be done a multitude of ways, gameplay, staking, betting, casino, live casino, etc. 

A `Poisson process` is a simple way of modelling transactions over time. However, another issue with simplicity is they cannot account for certain variables, in this case, churn. Therefore we can do a cross-product of another model called `Survival analysis`; this will give us a `hybrid probabilistic model`. The main focus points for this model are the rate parameter of the `Poisson distribution` and the `hazard of churn per unit of time`. This model will give us a prediction of whether or not the customer is still within our database at the given time, allowing us to predict if the customer has churned.

We can also look at `purchases per day`, which is a simple calculation of `# of purchases` divided by (`max(date)` minus `min(date)`); if we then plot it by purchases per day vs time, we can look and determine if we want to examine the data deeper. If there are anomalies, we can split them by the denominator and remove any noise to have a less skewed calculation. 

Using the data acquired above, we can ascertain `revenue over a customer's lifetime`. Next are `variable costs`, which we must discuss with the accounting team to allow us to gain insight into the company's spending habits. 

These costs can range from servers, ads, employees, rent for locations, yearly event costs, etc. We would then sum up the total and divide it per customer; the number of customers must be the same when calculating customer lifetime spending. We want the averages to be based on a similar notation. 

Factoring these final values together, we can execute the primary LTV model, noting that because GGPoker is so complex, a simple LTV will not work here, and it makes more sense to split it up by segments of region and lifetime age as well. I would also argue poker players vs live casinos only, etc. Still, I would have to analyze the data to determine if it is enough of a difference in value to validate doing another model. 

**c. How much data would you need to have statistical significance?**

To determine statistical significance, we must first look at the two samples of data we want to compare, depending on the type of datasets, what kind of features and data types; then, we must analyze to understand further how much data we need. Depending on the situation, even 30 rows of data can be enough statistical significance. Therefore, we must delve further into data to understand our goal. 

First, we must establish our hypothesis, then calculate the P-value to determine if our data is statistically significant or not. 

Using scipy and the stats library we can utilize, there is a describe function that will give us various results. 
- nobs
- min/max
- mean
- variance
- skewness
- kurtosis

It is essential to look at the Gaussian distribution; the data distribution has the same mean and standard deviation. We can use a student's t-Test, a statistical hypothesis test that two independent data. This test is also a library in python which can be utilized in SciPy via ttest_ind(). We can compare alpha, a chosen significance level, with a p-value to determine if the test shows the data is significant, which in industry standard is 0.05. However, this can be adjusted depending on the hypothesis and requirements of the analysis. 

If we want to compare multiple data sets, we can change our approach to the analysis of variance test, which we can also utilize the SciPy function f_oneway(); this function gives us p-value and statistics, which we can compare to our decided alpha. 

These are the simple, fast way to determine how much data we would need to reach and have statistical significance. 

We can use Pearson's and Spearman's tests to determine if there is any redundancy in features before moving on to a more in-depth look into calculating statistical significance. Once we have these values, we can create a heatmap to visualize which features have statistical significance to each other. Any feature that has a p-value over 0.05 can be deemed as uncorrelated.