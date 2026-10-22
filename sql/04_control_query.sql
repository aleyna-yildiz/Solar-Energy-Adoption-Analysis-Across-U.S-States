-- Data Quality and Validation Checks

-- 1. Check missing state codes
SELECT
  COUNT(*) AS total_records,
  COUNTIF(state IS NULL OR TRIM(state) = '') AS missing_states
FROM `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.SolarEnergy`;

-- 2. Check electricity price values that cannot be cast directly
SELECT
  COUNT(*) AS total_records,
  COUNTIF(electricity_price_residential IS NULL) AS missing_prices,
  COUNTIF(
    electricity_price_residential IS NOT NULL
    AND SAFE_CAST(electricity_price_residential AS FLOAT64) IS NULL
  ) AS invalid_prices
FROM `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.SolarEnergy`;

-- 3. Compare total, residential, and non-residential installations
SELECT
  UPPER(TRIM(state)) AS state,
  SUM(SAFE_CAST(solar_system_count AS FLOAT64)) AS total_systems,
  SUM(SAFE_CAST(solar_system_count_residential AS FLOAT64))
    AS residential_systems,
  SUM(SAFE_CAST(solar_system_count_nonresidential AS FLOAT64))
    AS nonresidential_systems
FROM `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.SolarEnergy`
WHERE state IS NOT NULL AND TRIM(state) != ''
GROUP BY UPPER(TRIM(state))
ORDER BY total_systems DESC;