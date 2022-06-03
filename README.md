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
Session History <br />
Game History 

b. What fields would you expect to see in this table? / c. Please also include the data type of each field.
<br />

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

- Session_ID String FK >- S.Session_ID
- Date Datetime
- Hand_ID String
- Hole_Card String
- Hand_Value String
- Winner String
- Pot Float
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