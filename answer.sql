SELECT
    i.investor_id,
    s.sector_name,
    ROUND(
        (i.no_of_shares * 100.0)
        / SUM(i.no_of_shares) OVER (PARTITION BY i.investor_id),
        2
    ) AS percentage
FROM investor_transactions AS i
JOIN sectors AS s
    ON i.sector_id = s.sector_id;
