WITH fav_genre AS (
    SELECT genre, COUNT(*)
    FROM movies
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 1
)

SELECT sa.actor, ag.age
FROM starring_actors sa INNER JOIN movies m ON sa.movie_name = m.movie
AND m.genre = (SELECT genre FROM fav_genre)
INNER JOIN actor_ages ag ON ag.actor = sa.actor
ORDER BY 2 DESC, 1;