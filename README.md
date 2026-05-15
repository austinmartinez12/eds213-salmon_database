# Diet Composition of Smallmouth Bass and Rock Bass

## Purpose
The purpose of this repository was to use fish gut composition data from 2000–2004 to determine whether Smallmouth Bass or Rock Bass rely more heavily on fish or crayfish in their diets. To answer this, a DuckDB database was built from the gut composition tables, and a SQL query was executed in Python using the duckdb package to summarize prey counts for each species.

## Repository structure
```
.
├── Biocomplexity_database.sql
├── README.md
├── data_cleaning.ipynb
├── database
│   └── biocomplexity.duckdb
├── environment.yml
├── final_viz.ipynb
└── schema_diagram.png
```
## Contributers:
-   Austin Martinez

## Data access
The data was used was sourced from the following location:

Biocomplexity - Fish Gut Composition Data (2000–2004): Sourced from the EDI Data Portal using on this link: https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-ntl.128.8

## References & acknowledgements
1. Carpenter, S., J. Kitchell, T. Kratz, and B. Roth. 2022. Biocomplexity at North Temperate Lakes LTER; Coordinated Field Studies: Predation Study Data 2000 - 2004 ver 8. Environmental Data Initiative. https://doi.org/10.6073/pasta/5d73c86d652ce2f6cbffd12d4a4fb13e (Accessed 2026-04-20).

2. UCSB Library Research Data Services. (2024). EDS 213: Databases and data management – Lab modules. https://ucsb-library-research-data-services.github.io/bren-eds213/modules/labs/labs.html