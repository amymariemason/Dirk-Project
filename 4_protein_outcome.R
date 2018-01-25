# PROCR phenome-scan
#Author: Amy Mason, based on early script by Dirk
#
#
#
#SNP: SNP rs867186 
#X: protein C (value from phenome scanner; update when biobank gives more details)
#Y1: coronary artery disease 
#Y2: venous thromboembolism 
#
#
##################################################################
#
# creates files for Protein C outome
#
#
#
#
#


# Load data
setwd("//me-filer1/home$/am2609/My Documents/Programs/Dirk/Dirk/")
data <- read.table("PhenoScanner_GWAS_rs867186_36599.txt", as.is=T, header=T, sep="\t")

# subset to protein C outcomes

data<-data[grep("*protein c+",tolower(data$Trait)),]
keep<-data[1,]
keep$chr.pos<-gsub("*chr+", "", keep$Pos..hg19.)
keep[, c("chr", "pos")]<- str_split_fixed(keep$chr.pos, ":", 2)
keep$ref_al<-"G"

X_associations <- keep[, c("ï..SNP", "chr.pos", "chr", "pos" , "Effect.Allele", "ref_al", "Beta", "SE")]
names(X_associations) <- c("variantID", "chr.pos", "chr", "pos" , "a1", "a2", "beta", "se")

