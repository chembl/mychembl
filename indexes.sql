-- #1. Create table of parent molecules in RDKit format
select distinct c.molregno,mol_from_ctab(molfile::cstring) m into mols_rdkit from compound_structures c, molecule_hierarchy h where is_valid_ctab(molfile::cstring) and c.molregno=h.parent_molregno;
-- SELECT 1279988

alter table mols_rdkit add primary key (molregno);

-- #2. Create index for the table above
create index rdkit_mol_idx on mols_rdkit using gist(m);

-- #3. Create tables with different fingerprints of the selected molecules
select molregno, torsionbv_fp(m) as torsionbv, morganbv_fp(m,2) as mfp2, featmorganbv_fp(m,2) as ffp2, rdkit_fp(m) as rdkfp, atompairbv_fp(m) as atombv, layered_fp(m) as layeredfp, maccs_fp(m) as maccsfp into fps_rdkit from mols_rdkit;

-- #4. Create index for the fingerprints tables
create index fps_ttbv_idx on fps_rdkit using gist(torsionbv);
create index fps_mfp2_idx on fps_rdkit using gist(mfp2);
create index fps_ffp2_idx on fps_rdkit using gist(ffp2);
create index fps_rdkfp_idx on fps_rdkit using gist(rdkfp);
create index fps_atombv_idx on fps_rdkit using gist(atombv);
create index fps_layfp_idx on fps_rdkit using gist(layeredfp);
create index fps_maccsfp_idx on fps_rdkit using gist(maccsfp);

-- #5. Create the primary keys
alter table fps_rdkit add primary key (molregno);

-- #6. Create table from rdkit images
-- CREATE TABLE mol_pictures (molregno INT PRIMARY KEY, image BYTEA);
