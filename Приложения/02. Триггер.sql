DELIMITER $$
CREATE
	TRIGGER `discount_after_invoice`
	BEFORE UPDATE
	ON restaurant.Orders
FOR EACH ROW
BEGIN
     IF old.invoice IS NOT NULL AND new.discount_card IS NOT NULL  THEN
        INSERT INTO `Log` (employee, `order`, message)
	VALUES (old.waiter, old.id, 'try to add discount after invoice issued ');
	SET new.discount_card = NULL;
     END IF;
END;
$$
		