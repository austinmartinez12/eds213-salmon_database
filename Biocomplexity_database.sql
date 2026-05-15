
-- Biocomplexity Tables

-- 1. Biocomplexity: Coordinated Field Studies: Predator Fish Age Growth
CREATE TABLE predator_fish (
    year BIGINT,
    sampledate DATE,
    species VARCHAR,
    scalelabel VARCHAR PRIMARY KEY,
    length DOUBLE,
    weight DOUBLE
);
INSERT INTO predator_fish
SELECT * FROM read_csv('data/clean_data/fishscales.csv', header=true, quote='"', types={'sampledate': 'DATE'});

-- 2. Biocomplexity: Coordinated Field Studies: Predator Fish Diet Data
CREATE TABLE diet (
    year BIGINT,
    sampledate DATE,
    species VARCHAR,
    gutlabel VARCHAR PRIMARY KEY,
    scalelabel VARCHAR,
    length DOUBLE,
    weight DOUBLE,
    net_wt_odonata DOUBLE,
    net_wt_ephemeroptera DOUBLE,
    net_wt_crayfish DOUBLE,
    net_wt_fish DOUBLE,
    net_wt_smelt DOUBLE,
    net_wt_bluntnose DOUBLE,
    net_wt_mimicshiner DOUBLE,
    net_wt_other_fish DOUBLE,
    net_wt_diptera DOUBLE,
    net_wt_trichoptera DOUBLE,
    net_wt_hemiptera DOUBLE,
    net_wt_cladocera DOUBLE,
    net_wt_hydrocarina DOUBLE,
    net_wt_coleopterans DOUBLE,
    net_wt_amphipod DOUBLE,
    net_wt_emergent_aquatics DOUBLE,
    net_wt_terrestrial_inverts DOUBLE,
    FOREIGN KEY (scalelabel) REFERENCES predator_fish(scalelabel)
);
INSERT INTO diet
SELECT * FROM read_csv('data/clean_data/diet.csv', header=true, quote='"', types={'sampledate': 'DATE'});

-- 3. Biocomplexity: Coordinated Field Studies: Predator Fish Prey Data - Fish
CREATE TABLE prey_fish (
    year BIGINT,
    sampledate DATE,
    species VARCHAR,
    gutlabel VARCHAR,
    preyspecies VARCHAR,
    preylength DOUBLE,
    count BIGINT,
    FOREIGN KEY (gutlabel) REFERENCES diet(gutlabel)
);
INSERT INTO prey_fish
SELECT * FROM read_csv('data/clean_data/fish.csv', header=true, quote='"', types={'sampledate': 'DATE'})
WHERE gutlabel IN (SELECT gutlabel FROM diet); -- Only insert prey rows whose gutlabels exist in diet because not all fish had gut contents sampled.

-- 4. Biocomplexity: Coordinated Field Studies: Predator Fish Prey Data - CrayFish
CREATE TABLE prey_crayfish (
    year BIGINT,
    sampledate DATE,
    species VARCHAR,
    gutlabel VARCHAR,
    carap_length DOUBLE,
    chela_length_r DOUBLE,
    chela_length_l DOUBLE,
    sex VARCHAR,
    state VARCHAR,
    count BIGINT,
    FOREIGN KEY (gutlabel) REFERENCES diet(gutlabel)
);
INSERT INTO prey_crayfish
SELECT * FROM read_csv('data/clean_data/crayfish.csv', header=true, quote='"', types={'sampledate': 'DATE'})
WHERE gutlabel IN (SELECT gutlabel FROM diet); -- Filter to gutlabels present in diet since some crayfish prey records have no matching diet entry.