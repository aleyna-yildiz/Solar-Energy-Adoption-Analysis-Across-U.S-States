-- 2. Business Questions

-- 2.1 Residential vs. Non-Residential Solar Installations by State
SELECT
  UPPER(TRIM(state)) AS state,
  COUNT(DISTINCT county) AS total_counties,
  SUM(SAFE_CAST(solar_system_count AS FLOAT64)) AS total_systems,
  SUM(SAFE_CAST(solar_system_count_residential AS FLOAT64))
    AS residential_systems,
  SUM(SAFE_CAST(solar_system_count_nonresidential AS FLOAT64))
    AS nonresidential_systems,
  ROUND(
    SAFE_DIVIDE(
      SUM(SAFE_CAST(solar_system_count_residential AS FLOAT64)),
      SUM(SAFE_CAST(solar_system_count AS FLOAT64))
    ) * 100, 2
  ) AS residential_share_pct
FROM `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.SolarEnergy`
WHERE state IS NOT NULL AND TRIM(state) != ''
GROUP BY UPPER(TRIM(state))
HAVING total_systems > 0
ORDER BY total_systems DESC;

-- 2.2 Residential Incentives and Solar Panel Area by State
SELECT
  UPPER(TRIM(state)) AS state,
  ROUND(AVG(SAFE_CAST(incentive_count_residential AS FLOAT64)), 2)
    AS avg_residential_incentives,
  ROUND(SUM(SAFE_CAST(total_panel_area AS FLOAT64)), 2)
    AS total_panel_area,
  ROUND(AVG(SAFE_CAST(solar_panel_area_per_capita AS FLOAT64)), 4)
    AS panel_area_per_capita
FROM `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.SolarEnergy`
WHERE state IS NOT NULL AND TRIM(state) != ''
GROUP BY UPPER(TRIM(state))
ORDER BY avg_residential_incentives DESC;