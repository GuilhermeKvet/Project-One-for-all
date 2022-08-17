SELECT u.user_name AS usuario,
CASE
	WHEN MAX(YEAR(rh.reproduction_date)) >= 2021 THEN 'Usuário ativo'
    ELSE 'Usuário inativo'
END AS status_usuario
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.reproduction_history AS rh
ON u.user_id = rh.user_id
GROUP BY u.user_name
ORDER BY u.user_name;