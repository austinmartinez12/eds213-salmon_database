
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
    odonata BIGINT,
    net_wt_odonata DOUBLE,
    ephemeroptera BIGINT,
    net_wt_ephemeroptera DOUBLE,
    crayfish BIGINT,
    net_wt_crayfish DOUBLE,
    fish BIGINT,
    net_wt_fish DOUBLE,
    smelt BIGINT,
    net_wt_smelt DOUBLE,
    bluntnose BIGINT,
    net_wt_bluntnose DOUBLE,
    mimicshiner BIGINT,
    net_wt_mimicshiner DOUBLE,
    other_fish BIGINT,
    net_wt_other_fish DOUBLE,
    diptera BIGINT,
    net_wt_diptera DOUBLE,
    trichoptera BIGINT,
    net_wt_trichoptera DOUBLE,
    hemiptera BIGINT,
    net_wt_hemiptera DOUBLE,
    cladocera BIGINT,
    net_wt_cladocera DOUBLE,
    hydrocarina BIGINT,
    net_wt_hydrocarina DOUBLE,
    coleopterans BIGINT,
    net_wt_coleopterans DOUBLE,
    amphipod BIGINT,
    net_wt_amphipod DOUBLE,
    emergent_aquatics BIGINT,
    net_wt_emergent_aquatics DOUBLE,
    terrestrial_inverts BIGINT,
    net_wt_terrestrial_inverts DOUBLE,
    other BIGINT,
    net_wt_other DOUBLE,
    notes VARCHAR,
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
    id BIGINT PRIMARY KEY,
    FOREIGN KEY (gutlabel) REFERENCES diet(gutlabel)
);
INSERT INTO prey_fish
SELECT * FROM read_csv('data/clean_data/fish.csv', header=true, quote='"', types={'sampledate': 'DATE'});

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
    id BIGINT PRIMARY KEY,
    FOREIGN KEY (gutlabel) REFERENCES diet(gutlabel)
);
INSERT INTO prey_crayfish
SELECT * FROM read_csv('data/clean_data/crayfish.csv', header=true, quote='"', types={'sampledate': 'DATE'});