SELECT country, SUM(
	CASE 
        WHEN leisure_activity_type = 'Adventure park' THEN number_of_places
	    ELSE 0
	END
) AS adventure_park, SUM(
	CASE 
		WHEN leisure_activity_type = 'Golf' THEN number_of_places
		ELSE 0
	END
) AS golf, SUM(
	CASE 
		WHEN leisure_activity_type = 'River cruise' THEN number_of_places
		ELSE 0
	END
) AS river_cruise, SUM(
	CASE 
		WHEN leisure_activity_type = 'Kart racing' THEN number_of_places
		ELSE 0
	END
) AS kart_racing
FROM countryActivities
GROUP BY country
ORDER BY country;