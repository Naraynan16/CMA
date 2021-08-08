install.packages("vegan")

library(vegan)
PC_data_matrix<- read.table(file = "",header = T) #insert the file containing samples Vs alteration incidence.
PC_dm <- PC_data_matrix
rownames(PC_dm) <- PC_dm[,1]
PC_dm <- PC_dm[,-1]

permute_pc_dm<-permatswap(m = PC_dm,
                          method = "quasiswap",
                          times = "### type the number of iterations",
                          fixedmar = "both")
#output
View(permute_pc_dm$orig)
View(permute_pc_dm$perm[["insert a number from 1 to the maximum no. of iterations"]])


####
## This is a different method I tried to produce pairwaise tests for gene pairs for mutual exclusivity.

options(repos=c(getOption("repos"), "http://ccb.nki.nl/software/discover/repos/r"))
install.packages("discover")

library(discover)
PC_dm1 <- PC_dm[1:10,]

events <- discover.matrix(t(PC_dm1)) #makes a background matrix
subset <- rowSums(t(PC_dm1)) > 1 # we will only look for mutual exclusivity between genes that are mutated in at least 22 tumours
result <- pairwise.discover.test(events[subset, ]) # test pairwise gene pairs
#output
print(result) #summary 
print(result, fdr.threshold=0.05) #summary with fdr threshold = 0.05
View(result$p.values) # output p values of the pairs 
View(as.data.frame(result)) # This get the pairs of genes which are significantly mutually exclusive