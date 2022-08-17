SELECT ar.artist_name AS artista, al.album_name AS album, COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.album AS al
ON ar.artist_id = al.artist_id
INNER JOIN SpotifyClone.following_artists AS f
ON ar.artist_id = f.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;