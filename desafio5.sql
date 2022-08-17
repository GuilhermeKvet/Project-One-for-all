SELECT m.title AS cancao, COUNT(rh.user_id) AS reproducoes
FROM SpotifyClone.reproduction_history AS rh
INNER JOIN SpotifyClone.musics AS m
ON m.music_id = rh.music_id
GROUP BY m.title
ORDER BY reproducoes DESC
LIMIT 2;