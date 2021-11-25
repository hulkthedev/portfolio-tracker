-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/g7hX0E
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE `User` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(20)  NOT NULL ,
    `password` varchar(100)  NOT NULL ,
    `email` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `InvestmentType` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `type` varchar(20)  NOT NULL ,
    `name` varchar(100)  NOT NULL ,
    `isin` int  NULL ,
    PRIMARY KEY (
        `id`
    ),
    CONSTRAINT `uc_InvestmentType_isin` UNIQUE (
        `isin`
    )
);

CREATE TABLE `Investments` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `userId` int  NOT NULL ,
    `investTypeId` int  NOT NULL ,
    `dateTime` DATETIME  NOT NULL ,
    `quantity` float  NOT NULL ,
    `wallet` varchar(50)  NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `MarketHistory` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `investTypeId` int  NOT NULL ,
    `dateTime` DATETIME  NOT NULL ,
    `price` float  NOT NULL ,
    `indicator` float  NOT NULL ,
    `currency` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `TradeHistory` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `userId` int  NOT NULL ,
    `investTypeId` int  NOT NULL ,
    `dateTime` DATETIME  NOT NULL ,
    `tradeType` varchar(4)  NOT NULL ,
    `tradeQuantity` float  NOT NULL ,
    `totalQuantity` float  NOT NULL ,
    `price` float  NOT NULL ,
    `currency` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `UserConfig` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `userId` int  NOT NULL ,
    `language` varchar(2)  NOT NULL ,
    `timeout` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `ConfigCurrency` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(10)  NOT NULL ,
    `symbol` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- 1, "EUR", "€"
-- 2, "USD", "$"
-- 3, "BTC", "BTC"
CREATE TABLE `ConfigInvestmentTypes` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `type` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- 1, "CASH"
-- 2, "CRYPTO"
-- 3, "STOCK"
-- 4, "ETF"
-- 5, "FOND"
-- 6, "PRECIOUS_METAL"
CREATE TABLE `ConfigTradingTypes` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `type` varchar(4)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- 1, "SELL"
-- 2, "BUY"
CREATE TABLE `ConfigLanguages` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `language` varchar(2)  NOT NULL ,
    `descriptopn` varchar(25)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

ALTER TABLE `Investments` ADD CONSTRAINT `fk_Investments_userId` FOREIGN KEY(`userId`)
REFERENCES `User` (`id`);

ALTER TABLE `Investments` ADD CONSTRAINT `fk_Investments_investTypeId` FOREIGN KEY(`investTypeId`)
REFERENCES `InvestmentType` (`id`);

ALTER TABLE `MarketHistory` ADD CONSTRAINT `fk_MarketHistory_investTypeId` FOREIGN KEY(`investTypeId`)
REFERENCES `InvestmentType` (`id`);

ALTER TABLE `TradeHistory` ADD CONSTRAINT `fk_TradeHistory_userId` FOREIGN KEY(`userId`)
REFERENCES `User` (`id`);

ALTER TABLE `TradeHistory` ADD CONSTRAINT `fk_TradeHistory_investTypeId` FOREIGN KEY(`investTypeId`)
REFERENCES `InvestmentType` (`id`);

ALTER TABLE `UserConfig` ADD CONSTRAINT `fk_UserConfig_userId` FOREIGN KEY(`userId`)
REFERENCES `User` (`id`);

