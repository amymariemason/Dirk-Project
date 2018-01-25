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

# load proxy
setwd("//me-filer1/home$/am2609/My Documents/Programs/Dirk/Dirk/")
# based on British Europeon poputalation from https://analysistools.nci.nih.gov/LDlink/?var=rs867186&pop=GBR&r2_d=r2&tab=ldproxy on 24/01
proxy<-read.table("proxy66076.txt", header=TRUE)
proxy<-proxy[proxy$Dprime==1 &proxy$R2==1,]
proxy$subCoord<-gsub("chr","",proxy$Coord)

# output proxy list
write(proxy$subCoord, file="proxy_list.txt", sep = " ",ncol=nrow(proxy)+1 )
