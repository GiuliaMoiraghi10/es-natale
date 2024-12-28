# ESERCIZI VACANZE NATALE - DATABASE

### 1. Selezionare tutti gli uffici, ordinati per nazione
``` sql
SELECT *
FROM `offices`
order by `country`
```

### 2. Selezionare tutti gli uffici, ordinati per nazione e per città
``` sql
SELECT *
FROM `offices`
ORDER BY `country` AND `city`
```

### 3. Selezionare tutti gli impiegati, ordinati per titolo e per nome
``` sql
SELECT *
FROM `employees`
ORDER BY `title` AND `name`
```

### 4. Contare quanti impiegati condividono lo stesso ufficio
``` sql
SELECT COUNT(*) AS `same_office`, `office_id`
FROM `employees`
GROUP BY `office_id`
```

### 5. Contare quanti impiegati condividono la stessa estensione
``` sql
SELECT COUNT(*) AS `same_extension`, `extension`
FROM `employees`
GROUP BY `extension`
```

### 6. Selezionare tutti i prodotti con quantità inferiore a 500 pezzi
``` sql
SELECT *
FROM `products`
WHERE `qty` <= 500
```

### 7. Selezionare tutti i prodotti Ford
``` sql
SELECT *
FROM `products`
WHERE `name` LIKE '%Ford%'
```

### 8. Contare quanti prodotti Ford hanno quantità inferiore a 500 pezzi
``` sql
SELECT COUNT(*)
FROM `products`
WHERE `name` LIKE '%Ford%'
AND `qty` < 500
```

### 9. Per ogni impiegato mostrare il suo diretto superiore (tip: usa un alias quando fai la join)
``` sql
SELECT e.`name`, e.`lastname`, c.`employee_id`, e.`id`, c.`name`, c.`lastname`
FROM `customers` AS c
JOIN `employees` As e
ON e.`id` = c.`employee_id`
```

### 10. Per ogni impiegato mostrare il numero di telefono completo (numero ufficio + estensione)
``` sql
SELECT `employees`.`name`, `employees`.`lastname`, `offices`.`phone`,`employees`.`extension`
FROM `employees`
JOIN `offices`
ON `employees`.`office_id`=`offices`.`id`
```

### 11. Selezionare i 10 ordini più recenti
``` sql
SELECT `orders`.`date`, `customers`.`name`, `customers`.`lastname`
FROM `orders`
JOIN `customers`
ON `orders`.`customer_id` = `customers`.`id`
ORDER BY `date` DESC
LIMIT 10
```
