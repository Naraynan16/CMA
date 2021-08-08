install.packages("vegan")
library(vegan)
PC_data_matrix<- read.table(file = "pancan_gam_filtered_calls.txt",header = T) #insert the file containing samples Vs alteration incidence.
PC_dm <- PC_data_matrix
rownames(PC_dm) <- PC_dm[,1]
PC_dm <- PC_dm[,-1]

permute_pc_dm<-permatswap(m = PC_dm,
                          method = "quasiswap",
                          times = 1,
                          fixedmar = "both")
#output
View(permute_pc_dm$perm[[1]])
