SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurant
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `restaurant` ;

CREATE SCHEMA IF NOT EXISTS `restaurant` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `restaurant` ;

-- -----------------------------------------------------
-- Table `restaurant`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`Menus` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`Menus` (
  `id` INT NOT NULL,
  `name` LONGTEXT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`MenusGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`MenusGroups` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`MenusGroups` (
  `id` INT NOT NULL,
  `menu` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_MenuGroups_Menu_idx` (`menu` ASC) VISIBLE,
  CONSTRAINT `fk_MenuGroups_Menu`
    FOREIGN KEY (`menu`)
    REFERENCES `restaurant`.`Menus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`MenusItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`MenusItems` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`MenusItems` (
  `id` INT NOT NULL,
  `group` INT NOT NULL,
  `name` LONGTEXT NOT NULL,
  `picture` LONGTEXT NULL,
  `weight` DOUBLE NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_MenuItems_MenuGroups1_idx` (`group` ASC) VISIBLE,
  CONSTRAINT `fk_MenuItems_MenuGroups1`
    FOREIGN KEY (`group`)
    REFERENCES `restaurant`.`MenusGroups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`Positions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`Positions` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`Positions` (
  `id` INT NOT NULL,
  `name` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`Employees` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`Employees` (
  `id` INT NOT NULL,
  `name` LONGTEXT NOT NULL,
  `patronymic` LONGTEXT NULL,
  `surname` LONGTEXT NOT NULL,
  `employment_date` DATETIME NOT NULL,
  `dismiss_date` DATETIME NULL,
  `position` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Employee_Positions1_idx` (`position` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Positions1`
    FOREIGN KEY (`position`)
    REFERENCES `restaurant`.`Positions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`DiscountsGroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`DiscountsGroups` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`DiscountsGroups` (
  `id` INT NOT NULL,
  `name` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`DiscountsCards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`DiscountsCards` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`DiscountsCards` (
  `id` INT NOT NULL,
  `card_no` LONGTEXT NOT NULL,
  `holder_name` LONGTEXT NOT NULL,
  `discount_group` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DiscountsCards_DiscountGroups1_idx` (`discount_group` ASC) VISIBLE,
  CONSTRAINT `fk_DiscountsCards_DiscountGroups1`
    FOREIGN KEY (`discount_group`)
    REFERENCES `restaurant`.`DiscountsGroups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`Orders` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`Orders` (
  `id` INT NOT NULL,
  `date_time` DATETIME NOT NULL,
  `table` LONGTEXT NOT NULL,
  `waiter` INT NOT NULL,
  `invoice` DATETIME NULL,
  `discount_card` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Orders_Employee1_idx` (`waiter` ASC) VISIBLE,
  INDEX `fk_Orders_DiscountsCards1_idx` (`discount_card` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Employee1`
    FOREIGN KEY (`waiter`)
    REFERENCES `restaurant`.`Employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_DiscountsCards1`
    FOREIGN KEY (`discount_card`)
    REFERENCES `restaurant`.`DiscountsCards` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`Payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`Payments` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`Payments` (
  `id` INT NOT NULL,
  `order` INT NOT NULL,
  `date_time` DATETIME NOT NULL,
  `sum` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Payments_Orders1_idx` (`order` ASC) VISIBLE,
  CONSTRAINT `fk_Payments_Orders1`
    FOREIGN KEY (`order`)
    REFERENCES `restaurant`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`Timesheet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`Timesheet` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`Timesheet` (
  `id` INT NOT NULL,
  `entry_time` DATETIME NOT NULL,
  `exit_time` DATETIME NULL,
  `employee` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Timesheet_Employee1_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `fk_Timesheet_Employee1`
    FOREIGN KEY (`employee`)
    REFERENCES `restaurant`.`Employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`OrdersItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`OrdersItems` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`OrdersItems` (
  `id` INT NOT NULL,
  `order` INT NOT NULL,
  `menu_item` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_OrderItems_MenuItems1_idx` (`menu_item` ASC) VISIBLE,
  INDEX `fk_OrderItems_Orders1_idx` (`order` ASC) VISIBLE,
  CONSTRAINT `fk_OrderItems_MenuItems1`
    FOREIGN KEY (`menu_item`)
    REFERENCES `restaurant`.`MenusItems` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItems_Orders1`
    FOREIGN KEY (`order`)
    REFERENCES `restaurant`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`Discounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`Discounts` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`Discounts` (
  `id` INT NOT NULL,
  `discount_group` INT NOT NULL,
  `discount` DECIMAL NOT NULL,
  `expiration` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Discounts_DiscountGroups1_idx` (`discount_group` ASC) VISIBLE,
  CONSTRAINT `fk_Discounts_DiscountGroups1`
    FOREIGN KEY (`discount_group`)
    REFERENCES `restaurant`.`DiscountsGroups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`Log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`Log` ;

CREATE TABLE IF NOT EXISTS `restaurant`.`Log` (
  `date_time` DATETIME NOT NULL DEFAULT NOW(),
  `employee` INT NULL,
  `order` INT NULL,
  `message` LONGTEXT NOT NULL,
  INDEX `fk_log_Employees1_idx` (`employee` ASC) VISIBLE,
  INDEX `fk_Log_Orders1_idx` (`order` ASC) VISIBLE,
  CONSTRAINT `fk_log_Employees1`
    FOREIGN KEY (`employee`)
    REFERENCES `restaurant`.`Employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Log_Orders1`
    FOREIGN KEY (`order`)
    REFERENCES `restaurant`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `restaurant` ;

-- -----------------------------------------------------
-- Placeholder table for view `restaurant`.`OpenOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`OpenOrders` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `restaurant`.`MenusView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`MenusView` (`menu_name` INT, `group_name` INT, `dish` INT, `weight` INT, `price` INT);

-- -----------------------------------------------------
-- Placeholder table for view `restaurant`.`PaymentsToday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`PaymentsToday` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `restaurant`.`IncomesByWaiter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`IncomesByWaiter` (`id` INT);

-- -----------------------------------------------------
-- function fio
-- -----------------------------------------------------

USE `restaurant`;
DROP function IF EXISTS `restaurant`.`fio`;

DELIMITER $$
USE `restaurant`$$
CREATE FUNCTION fio ( sn LONGTEXT, nm LONGTEXT, pn LONGTEXT) RETURNS LONGTEXT
    DETERMINISTIC NO SQL
BEGIN
    DECLARE res LONGTEXT DEFAULT '';

    IF sn IS NOT NULL THEN
        SET res = sn;
    END IF;

    IF nm IS NOT NULL THEN
        IF NOT LENGTH(res) = 0 THEN
            set res = CONCAT(res, ' ');
        END IF;
        set res = CONCAT(res, LEFT(nm,1), '.');
        IF pn IS NOT NULL THEN
            set res = CONCAT(res, LEFT(pn,1), '.');
        END IF;
    END IF;

    RETURN res;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `restaurant`.`OpenOrders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`OpenOrders`;
DROP VIEW IF EXISTS `restaurant`.`OpenOrders` ;
USE `restaurant`;
CREATE  OR REPLACE VIEW `OpenOrders` AS 
WITH m AS (
    SELECT m.id      menu_id,
           m.`name`  menu_name,
           mg.id     group_id,
           mg.`name` group_name,
           mi.id     item_id,
           mi.`name` item_name,
           mi.weight,
           mi.price
    FROM Menus m
             INNER JOIN MenusGroups mg on m.id = mg.menu
             INNER JOIN MenusItems mi on mg.id = mi.`group`
),

o AS (
    SELECT
        o.id as order_id,
        o.date_time,
        o.`table`,
        o.waiter,
        o.invoice,
        o.discount_card,
        oi.menu_item,
        oi.quantity
    FROM
        restaurant.Orders o
            INNER JOIN OrdersItems oi on oi.order=o.id
),

e AS (
    SELECT
        e.id employee_id,
        fio(e.surname, e.name,  e.patronymic) fio_name,
        e.name,
        e.patronymic,
        e.surname,
        p.name position_name
    FROM Employees e
             INNER JOIN Positions p on e.position = p.id
)

SELECT
       o.order_id,
       o.date_time as opened,
       o.`table`,
       e.position_name,
       e.fio_name waiter,
       m.item_name,
       m.price,
       o.quantity,
       m.price * o.quantity as sum,
       SUM(price * o.quantity) OVER (PARTITION BY order_id) order_sum
FROM o
    INNER JOIN m ON o.menu_item = m.item_id
    INNER JOIN e ON o.waiter = e.employee_id
WHERE o.invoice IS NULL;

-- -----------------------------------------------------
-- View `restaurant`.`MenusView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`MenusView`;
DROP VIEW IF EXISTS `restaurant`.`MenusView` ;
USE `restaurant`;
CREATE  OR REPLACE VIEW `MenusView` AS 
SELECT
    m.name menu_name,
    mg.name group_name,
    mi.name dish,
    weight,
    price
FROM
    Menus m inner join
    MenusGroups mg on m.id=mg.menu inner join
    MenusItems mi on mg.id=mi.`group`;

-- -----------------------------------------------------
-- View `restaurant`.`PaymentsToday`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`PaymentsToday`;
DROP VIEW IF EXISTS `restaurant`.`PaymentsToday` ;
USE `restaurant`;
CREATE  OR REPLACE VIEW `PaymentsToday` AS 
SELECT *, SUM(sum) OVER() total
FROM Payments p
WHERE DATE(p.date_time) IN (
    SELECT DATE(MAX(p.date_time)) as last_date
    FROM Payments p
);

-- -----------------------------------------------------
-- View `restaurant`.`IncomesByWaiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant`.`IncomesByWaiter`;
DROP VIEW IF EXISTS `restaurant`.`IncomesByWaiter` ;
USE `restaurant`;
CREATE  OR REPLACE VIEW `IncomesByWaiter` AS
WITH m AS (
    SELECT m.id      menu_id,
           m.`name`  menu_name,
           mg.id     group_id,
           mg.`name` group_name,
           mi.id     item_id,
           mi.`name` item_name,
           mi.weight,
           mi.price
    FROM Menus m
             INNER JOIN MenusGroups mg on m.id = mg.menu
             INNER JOIN MenusItems mi on mg.id = mi.`group`
),

     o AS (
         SELECT
             o.id as order_id,
             o.date_time,
             o.`table`,
             o.waiter,
             o.invoice,
             o.discount_card,
             oi.menu_item,
             oi.quantity
         FROM
             restaurant.Orders o
                 INNER JOIN OrdersItems oi on oi.order=o.id
     ),

     e AS (
         SELECT
             e.id employee_id,
             fio(e.surname, e.name,  e.patronymic) fio_name,
             e.name,
             e.patronymic,
             e.surname,
             p.name position_name
         FROM Employees e
                  INNER JOIN Positions p on e.position = p.id
     )

SELECT
    e.fio_name waiter,
    o.order_id,
    o.date_time as opened,
    o.`table`,
    p.sum as paiment_sum,
    SUM(m.price * o.quantity) as order_sum,
    SUM(p.sum) OVER (PARTITION BY e.fio_name) as total_sum
FROM o
         INNER JOIN m ON o.menu_item = m.item_id
         INNER JOIN e ON o.waiter = e.employee_id
         INNER JOIN Payments p ON p.`order` = o.order_id
WHERE o.invoice IS NOT NULL
GROUP BY
    e.fio_name,
    o.order_id,
    o.date_time,
    o.`table`,
    p.sum
order by e.fio_name
;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
