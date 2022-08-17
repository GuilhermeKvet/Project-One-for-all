SELECT u.user_name AS usuario, COUNT(rh.user_id) AS qt_de_musicas_ouvidas, CAST(SUM(m.duration)/60 AS DECIMAL(5,2)) AS total_minutos
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.reproduction_history AS rh
ON u.user_id = rh.user_id
INNER JOIN SpotifyClone.musics AS m
ON rh.music_id  = m.music_id
GROUP BY rh.user_id
ORDER BY u.user_name;