# CompositionalPlots
# Language: R
# Input: TXT
# Output: PREFIX
# Tested with: PluMA 1.1, R 4.0.0
# Dependencies: microbiome 1.12, ggplot2 3.3.5

PluMA plugin that computes Compositional Plots, one for each phylogenetic level.

The following are specified in the input TXT file, as tab-delimited keyword-value pairs.

otufile: OTU abundances (CSV)
mapping: Mapping table (CSV)
tree: Phylogenetic tree (CSV)


The plot will then be generated using the provided prefix (prefix.pdf), with a supplemental prefix.csv file containing relative abundance values for species.
