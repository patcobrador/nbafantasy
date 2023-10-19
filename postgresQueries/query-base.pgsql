WITH cte AS (
    SELECT *
    FROM public.boxscore_base_log
    WHERE "gameId" = 42200405 -- 29
        AND "playerSlug" = 'jimmy-butler'
)
SELECT unnest(array['playerSlug', 'points', 'fieldGoalsPercentage', 'freeThrowsPercentage', 'threePointersMade', 'reboundsTotal', 'assists', 'steals', 'blocks', 'turnovers']) AS column_name,
       unnest(array[
           "playerSlug", 
           CAST("points" AS TEXT), 
           CAST("fieldGoalsPercentage" AS TEXT), 
           CAST("freeThrowsPercentage" AS TEXT), 
           CAST("threePointersMade" AS TEXT), 
           CAST("reboundsTotal" AS TEXT), 
           CAST("assists" AS TEXT), 
           CAST("steals" AS TEXT), 
           CAST("blocks" AS TEXT), 
           CAST("turnovers" AS TEXT)
       ]) AS column_value
FROM cte;