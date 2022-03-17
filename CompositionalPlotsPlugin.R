#library("phyloseq")
#library("dplyr")
#library("reshape2")
#library("vegan")
library("ggplot2")
library("microbiome")
#library("hrbrthemes")
#library("gcookbook")
#library("tidyverse")


dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
  pfix = prefix()
  if (length(pfix) != 0) {
     prefix <- paste(pfix, "/", sep="")
  }

  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   # Need to get the three files
#paste(pfix, toString(parameters["inputfile",2]), sep="")
   otu.path <<- paste(pfix, toString(parameters["otufile", 2]), sep="")
   tree.path <<- paste(pfix, toString(parameters["tree", 2]), sep="")
   map.path <<- paste(pfix, toString(parameters["mapping", 2]), sep="")
pseq2 <<- read_csv2phyloseq(otu.file=otu.path, taxonomy.file=tree.path, metadata.file=map.path, sep=",")
#pseq2 = read_csv2phyloseq(otu.file="asv.tab.norm.csv", taxonomy.file="asv.taxonomy.quoted.padded.csv", metadata.file="../sample_data.csv", sep=",")
}


run <- function() {

}

output <- function(outputfile) {
	 pdf(paste(outputfile,"pdf",sep="."))#
#############################################################################################################
pseq2.top <- microbiome::aggregate_top_taxa(pseq2, "Kingdom", top = 10)
p <- plot_composition(pseq2.top,
                      taxonomic.level = "Kingdom",
                      sample.sort = "Description",
                      x.label = "Samples") +
  labs(x = "Samples", y = "Relative abundance (%)",
       title = "Relative abundance data") +
theme(legend.position="bottom", legend.title = element_text(size=4),
legend.text = element_text(size=4)) + guides(fill = guide_legend(ncol = 12, keyheight=0.5, keywidth=0.5))
print(p)
#############################################################################################################
#############################################################################################################
pseq2.top <- microbiome::aggregate_top_taxa(pseq2, "Phylum", top = 10)
p <- plot_composition(pseq2.top,
                      taxonomic.level = "Phylum",
                      sample.sort = "Description",
                      x.label = "Samples") +
  labs(x = "Samples", y = "Relative abundance (%)",
       title = "Relative abundance data") +
theme(legend.position="bottom", legend.title = element_text(size=4),
legend.text = element_text(size=4)) + guides(fill = guide_legend(ncol = 12, keyheight=0.5, keywidth=0.5))
print(p)
#############################################################################################################
#############################################################################################################
pseq2.top <- microbiome::aggregate_top_taxa(pseq2, "Class", top = 10)
p <- plot_composition(pseq2.top,
                      taxonomic.level = "Class",
                      sample.sort = "Description",
                      x.label = "Samples") +
  labs(x = "Samples", y = "Relative abundance (%)",
       title = "Relative abundance data") +
theme(legend.position="bottom", legend.title = element_text(size=4),
legend.text = element_text(size=4)) + guides(fill = guide_legend(ncol = 12, keyheight=0.5, keywidth=0.5))
print(p)
#############################################################################################################
#############################################################################################################
pseq2.top <- microbiome::aggregate_top_taxa(pseq2, "Order", top = 10)
p <- plot_composition(pseq2.top,
                      taxonomic.level = "Order",
                      sample.sort = "Description",
                      x.label = "Samples") +
  labs(x = "Samples", y = "Relative abundance (%)",
       title = "Relative abundance data") +
theme(legend.position="bottom", legend.title = element_text(size=4),
legend.text = element_text(size=4)) + guides(fill = guide_legend(ncol = 12, keyheight=0.5, keywidth=0.5))
print(p)
#############################################################################################################
#############################################################################################################
pseq2.top <- microbiome::aggregate_top_taxa(pseq2, "Family", top = 10)
p <- plot_composition(pseq2.top,
                      taxonomic.level = "Family",
                      sample.sort = "Description",
                      x.label = "Samples") +
  labs(x = "Samples", y = "Relative abundance (%)",
       title = "Relative abundance data") +
theme(legend.position="bottom", legend.title = element_text(size=4),
legend.text = element_text(size=4)) + guides(fill = guide_legend(ncol = 12, keyheight=0.5, keywidth=0.5))
print(p)
#############################################################################################################

#############################################################################################################
pseq2.top <- microbiome::aggregate_top_taxa(pseq2, "Genus", top = 10)
p <- plot_composition(pseq2.top,
                      taxonomic.level = "Genus",
                      sample.sort = "Description",
                      x.label = "Samples") +
  labs(x = "Samples", y = "Relative abundance (%)",
       title = "Relative abundance data") +
theme(legend.position="bottom", legend.title = element_text(size=4),
legend.text = element_text(size=4)) + guides(fill = guide_legend(ncol = 12, keyheight=0.5, keywidth=0.5))
print(p)
#############################################################################################################
#############################################################################################################
pseq2.top <- microbiome::aggregate_top_taxa(pseq2, "Species", top = 10)
p <- plot_composition(pseq2.top,
                      taxonomic.level = "Species",
                      sample.sort = "Description",
                      x.label = "Samples") +
  labs(x = "Samples", y = "Relative abundance (%)",
       title = "Relative abundance data") +
theme(legend.position="bottom", legend.title = element_text(size=4),
legend.text = element_text(size=4)) + guides(fill = guide_legend(ncol = 12, keyheight=0.5, keywidth=0.5))
print(p)
#############################################################################################################
write.csv(p$data, paste(outputfile,"csv",sep="."))
dev.off()
}
