# This SQL file aims to extract features from GTF files (for chromosome 20 in this case)

# Example row:
# chr20	HAVANA	gene	87250	97094	.	+	.	gene_id "ENSG00000178591.7"; gene_type "protein_coding"; gene_name "DEFB125"; level 2; hgnc_id "HGNC:18105"; havana_gene "OTTHUMG00000031614.4";

# Create the table
CREATE TABLE gencode(
	seqid VARCHAR,
	source VARCHAR,
	type VARCHAR,
	sstart INT,
	send INT,
	score VARCHAR,
	strand VARCHAR,
	phase VARCHAR,
	attr VARCHAR
);

# Import the gtf data
.mode tabs
.import chr20.gtf gencode

# Save the data 
.headers on
.mode csv
.output chr20.csv
SELECT type AS Type, sstart AS Start, send AS End
FROM gencode
ORDER BY sstart, send ASC;

# Reset stdout to console
.output