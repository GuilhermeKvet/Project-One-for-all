SELECT m.title AS nome, COUNT(rh.music_id) AS reproducoes
FROM SpotifyClone.musics AS m
INNER JOIN SpotifyClone.reproduction_history AS rh
ON m.music_id = rh.music_id
INNER JOIN SpotifyClone.users AS u
ON u.user_id = rh.user_id
WHERE u.plan_id IN (1, 4)
GROUP BY m.title
ORDER BY nome;