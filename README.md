Solar Energy Analysis

Project Overview

This project explores solar energy adoption across U.S. states using data analysis and SQL. It focuses on residential and non-residential solar installations, geographic differences in solar adoption, and potential relationships between solar installations, electricity prices, and residential incentives.

The project uses Google BigQuery for data querying and aggregation and Python for data analysis and visualization.

Objectives

* Compare residential and non-residential solar installations across states.
* Identify states with the highest numbers of solar installations.
* Examine differences in residential solar adoption between states.
* Explore potential relationships between electricity prices, residential incentives, and solar adoption.
* Assess data quality and document limitations that may affect interpretation.

Tools and Technologies

* SQL — Data querying, aggregation, and validation.
* Google BigQuery — Data storage and processing.
* Python — Data analysis.
* Pandas — Data manipulation.
* Matplotlib and Seaborn — Data visualization.
* Jupyter Notebook — Interactive analysis and documentation.
* Git and GitHub — Version control and project sharing.

Dataset

The project uses a solar energy dataset containing geographic information and variables related to solar installations across the United States.

The analysis uses state-level aggregated data derived from the source table in BigQuery.

Key variables include: Variable

Description

state

State identifier

total_counties

Number of distinct counties represented in the data

total_tracts

Number of distinct FIPS values

total_systems

Aggregated number of solar systems

residential_systems

Aggregated number of residential solar systems

nonresidential_systems

Aggregated number of non-residential solar systems

total_panel_area

Aggregated solar panel area

avg_elec_price_residential

Average residential electricity price after data cleaning

avg_incentives_residential

Average residential incentive count

total_population

Aggregated population

total_households

Aggregated household count

The state-level summary currently contains 49 rows and 11 columns. The geographic coverage and aggregation logic should be considered when interpreting the results.

Project Structure

solar-energy-analysis/
├── notebooks/
│   └── solar-energy-analysis.ipynb
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_business_questions.sql
│   ├── 03_create_summary_view.sql
│   └── 04_control_query.sql
├── data/
│   └── raw/
├── outputs/
│   ├── figures/
│   └── tables/
├── .gitignore
└── README.md

The SQL filenames above describe the intended organization. Ensure the files are saved in the repository before publishing it. Raw data is not included in the current project structure.

Analysis

The project investigates the following questions:

1. How are solar installations distributed across U.S. states?
2. How does residential solar adoption compare with non-residential adoption?
3. Which states have the highest numbers of solar installations?
4. How does the residential share of solar installations vary by state?
5. What relationships, if any, can be observed between residential electricity prices, incentives, and solar adoption?

SQL is used to aggregate the source data by state and prepare a summary view for Python analysis. The notebook uses the aggregated data to create visualizations and explore patterns across states.

Visualizations

The project includes visualizations covering:

* States with the highest numbers of solar installations.
* Residential versus non-residential installations.
* Residential solar installation shares across states.
* Electricity price distributions and their relationship with solar installations.
* Residential incentives and solar adoption.

Electricity price and incentive visualizations require additional validation before their results can be interpreted confidently.

Data Quality and Limitations

Several limitations are important when interpreting this analysis:

* Electricity price formatting: Some source values contain malformed characters. Removing non-numeric characters can produce misleading numeric values, so electricity price results require further validation.
* Geographic aggregation: Counts of distinct counties and FIPS values depend on the consistency and meaning of the source identifiers.
* Aggregated measures: Population, household counts, solar panel area, and solar system counts are summed across source records. Their accuracy depends on the source data’s geographic granularity and aggregation logic.
* Incentive definitions: The meaning and comparability of the residential incentive count should be confirmed before drawing conclusions.
* Geographic coverage: The summary contains 49 state-level records. It should not be assumed to represent all 50 U.S. states without checking the source data.

These limitations are documented to distinguish exploratory patterns from conclusions supported by validated data.

Key Takeaways

The project establishes a SQL-to-Python workflow for exploring state-level solar adoption. It combines BigQuery aggregation, data validation, and visual analysis to compare installation patterns across geographic areas.

Final conclusions about electricity prices, incentives, and their relationships with solar adoption will depend on further validation of the relevant source variables.

Future Improvements

* Validate electricity price values against the original source data.
* Confirm the definitions and units of incentive and panel-area variables.
* Review aggregation logic for population, households, and solar installations.
* Investigate geographic coverage and missing state records.
* Refine visualizations after data validation.
* Add a concise summary of validated findings.

Author

Aleyna Yildiz

GitHub: ⁠aleyna-yildiz