CREATE TABLE "Players" (
    "Player_ID" Int  NOT NULL ,
    "Email_Address" String  NOT NULL ,
    "Mobile_Number" String  NOT NULL ,
    "Username" String  NOT NULL ,
    "Nickname" String  NOT NULL ,
    "Agent" String  NOT NULL ,
    "Site" String  NOT NULL ,
    "Country" String  NOT NULL ,
    "Sign-up_Date" Datetime  NOT NULL ,
    "Last_Game_Play_Date" Datetime  NOT NULL ,
    "Account_Status" String  NOT NULL ,
    "KYC_Status" String  NOT NULL ,
    "Tags" String  NOT NULL ,
    "Maker" String  NOT NULL ,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "Player_ID"
    )
)

GO

CREATE TABLE "Session_History" (
    "Player_ID" Int  NOT NULL ,
    "Session_ID" String  NOT NULL ,
    "Session_start" Datetime  NOT NULL ,
    "Session_end" Datetime  NOT NULL ,
    "Blinds" String  NOT NULL ,
    "Table" String  NOT NULL ,
    "Type" String  NOT NULL ,
    "Hands" Int  NOT NULL ,
    "Duration" Datetime  NOT NULL ,
    "Winloss" Float  NOT NULL ,
    "Balance" Float  NOT NULL ,
    "Amount" Float  NOT NULL ,
    "Total_Rake" Float  NOT NULL ,
    "Total_Fee" Float  NOT NULL ,
    CONSTRAINT "pk_Session_History" PRIMARY KEY (
        "Session_ID"
    )
)

GO

CREATE TABLE "Game_History" (
    "Game_ID" String  NOT NULL ,
    "Session_ID" String  NOT NULL ,
    "Game_start" Datetime  NOT NULL ,
    "Hole_Card" String  NOT NULL ,
    "Hand_Value" String  NOT NULL ,
    "Winner" String  NOT NULL ,
    "Pot" Float  NOT NULL ,
    "Winloss" Float  NOT NULL ,
    CONSTRAINT "pk_Game_History" PRIMARY KEY (
        "Game_ID"
    )
)

GO

CREATE TABLE "Hand_History" (
    "Hand_ID" string  NOT NULL ,
    "Game_ID" Sting  NOT NULL ,
    "Hand_start" Datetime  NOT NULL ,
    "Hero_ID" Int  NOT NULL ,
    "Opponent_1_ID" Int  NOT NULL ,
    "Opponent_2_ID" Int  NOT NULL ,
    "Opponent_3_ID" Int  NOT NULL ,
    "Opponent_4_ID" Int  NOT NULL ,
    "Opponent_5_ID" Int  NOT NULL ,
    "Stack_Amount_Hero" Float  NOT NULL ,
    "Stack_Amount_1" Float  NOT NULL ,
    "Stack_Amount_2" Float  NOT NULL ,
    "Stack_Amount_3" Float  NOT NULL ,
    "Stack_Amount_4" Float  NOT NULL ,
    "Stack_Amount_5" Float  NOT NULL ,
    "Small_blind" Int  NOT NULL ,
    "Big_blind" Int  NOT NULL ,
    "Hole_Cards" String  NOT NULL ,
    "Pre_Flop_Action" String  NOT NULL ,
    "Flop_Action" String  NOT NULL ,
    "Turn_Action" String  NOT NULL ,
    "River_Action" String  NOT NULL ,
    "Showdown_Action" String  NOT NULL ,
    "Summary" String  NOT NULL ,
    "Total_pot" float  NOT NULL ,
    "Rake" Float  NOT NULL ,
    "Fee" Float  NOT NULL ,
    "Jackpot" Float  NOT NULL ,
    "Bingo" Float  NOT NULL ,
    "Board" String  NOT NULL ,
    CONSTRAINT "pk_Hand_History" PRIMARY KEY (
        "Hand_ID"
    )
)

GO

ALTER TABLE "Session_History" ADD CONSTRAINT "fk_Session_History_Player_ID" FOREIGN KEY("Player_ID")
REFERENCES "Players" ("Player_ID")
GO

ALTER TABLE "Game_History" ADD CONSTRAINT "fk_Game_History_Session_ID" FOREIGN KEY("Session_ID")
REFERENCES "Session_History" ("Session_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Game_ID" FOREIGN KEY("Game_ID")
REFERENCES "Game_History" ("Game_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Hero_ID" FOREIGN KEY("Hero_ID")
REFERENCES "Players" ("Player_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Opponent_1_ID" FOREIGN KEY("Opponent_1_ID")
REFERENCES "Players" ("Player_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Opponent_2_ID" FOREIGN KEY("Opponent_2_ID")
REFERENCES "Players" ("Player_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Opponent_3_ID" FOREIGN KEY("Opponent_3_ID")
REFERENCES "Players" ("Player_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Opponent_4_ID" FOREIGN KEY("Opponent_4_ID")
REFERENCES "Players" ("Player_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Opponent_5_ID" FOREIGN KEY("Opponent_5_ID")
REFERENCES "Players" ("Player_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Small_blind" FOREIGN KEY("Small_blind")
REFERENCES "Players" ("Player_ID")
GO

ALTER TABLE "Hand_History" ADD CONSTRAINT "fk_Hand_History_Big_blind" FOREIGN KEY("Big_blind")
REFERENCES "Players" ("Player_ID")
GO

