#GWAS Septoria 
## Phenotype data

# install library tidyverse
library(tidyverse)

# setting working directory
setwd("~/Documents/Poplar/")

# functions
getmode <- function(x){
  uniqx <- unique(x)
  uniqx[which.max(tabulate(match(x, uniqx)))]
}

#---------------
# loading data
measures <- c(Height.cm. = "numeric", X.Cankers = "numeric", 
              Canker.per.cm = "numeric", DS.1.5. = "numeric")

sept <- read.table("Final GWAS Dataset for DOE.csv", sep = "\t", header = T,
                  colClasses= measures) |>
                  as_tibble()
# creating a uniqe identifier
sept$isotype <- paste(sept$Isolate,sept$Genotype,sept$State, sep = "--")

# Getting functions = mean and mode
h <- sept |> 
    group_by(isotype) |>
    na.omit()|>
    summarise_at(vars(Height.cm.), 
                 list(Height.cm. = mean))
c <-  sept |>
  group_by(isotype) |>
  na.omit()|>
  summarise_at(vars(X.Cankers), 
               list(X.Cankers = mean))
cc <- sept |> 
  group_by(isotype) |>
  na.omit()|>
  summarise_at(vars(Canker.per.cm), list(canker.cm = mean))

ds <- sept |>
  group_by(isotype) |>
  na.omit()|>
  summarise_at(vars(DS.1.5.), list(DS = getmode))

# creating a new a list of data.frames
lsept <- list(h, c, cc, ds)
# reducing dataset by groups
septoria <- lsept |>
            reduce(full_join, by='isotype')

names <- as.data.frame(do.call(rbind, 
                         strsplit(septoria$isotype, split = "--")))
colnames(names) <- c("Isolate", "Genotype", "State")
septoria <- cbind(names, septoria) |>
            as_tibble()
# Results
septoria

write.csv(septoria, "septoria_GWAS_dataset_mean.csv")
