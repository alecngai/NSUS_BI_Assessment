# NSUS_BI_Assessment

## Log into your newly created account and explore the software
a. What are your first impressions of the software? <br />
b. What game features and promotions look interesting?

## Please share a brief summary detailing your experience, including:
a. What was your favourite game? Why?  <br />
b. What was your least favourite game? Why? <br />
c. Were there any surprising or unexpected parts you came across? <br />
d. Were there parts of the experience you found confusing? 

## Your gameplay from Part 1 is stored in our game history database.
a. What tables would you expect to be populated?<br />
Players <br />
Session History <br />
Game History <br />
Hand History

b. What fields would you expect to see in this table? */* c. Please also include the data type of each field.
<br />

![ERD](https://raw.githubusercontent.com/alecngai/NSUS_BI_Assessment/main/Resources/ERD_Final.png)

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


d. What are some challenges you might expect over time as the # of rows increase
exponentially

## Using the fields you provide in Q1, populate a hypothetical game history table with the results of your $0.25 Spin & Gold from Part 1 of the assessment.
a. Provide a sample of a few row entries in the table, using the fields you came up
with as columns

## In addition to the game history table, what other tables would you expect to see stored on the backend? Please specify the fields along with their data types.
a. What would be a suitable primary key to relate the various tables?

## The United Kingdom marketing manager has sent a request to the BI team to set up Tableau dashboards to monitor newly acquired customers.
a. Which of the tables in Question 3 would you use? <br />
b. Describe the dashboard(s) you would create.<br />
c. What metrics would the marketing manager be interested in to evaluate the
performance of a marketing campaign to acquire new players?

## The UK team was elated with your acquisition dashboard and has requested a Life Time Value model to project the value of newly signed up customers.
a. How would you design such a model?<br />
b. What variables would you use?<br />
c. How much data would you need to have statistical significance?