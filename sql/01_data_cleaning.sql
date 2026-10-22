
-- 1.1 Missing Values Analysis
SELECT
  COUNT(*) AS total_records,
  COUNTIF(state IS NULL OR state = '') AS missing_states,
  COUNTIF(county IS NULL OR county = '') AS missing_counties,
  COUNTIF(solar_system_count IS NULL) AS missing_system_counts,
  COUNTIF(latitude IS NULL OR longitude IS NULL) AS missing_coordinates
FROM `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.SolarEnergy`;


-- 1.2 Data Type Conversion and Invalid Values Check
SELECT
  state,
  county,
  solar_system_count,
  SAFE_CAST(solar_system_count AS FLOAT64) AS casted_system_count,
  SAFE_CAST(electricity_price_residential AS FLOAT64) AS casted_elec_price
FROM `project-5d6606df-1ef4-4c92-b34.solar_energy_analysis.SolarEnergy`
WHERE SAFE_CAST(solar_system_count AS FLOAT64) IS NULL
  AND solar_system_count IS NOT NULL
LIMIT 10;