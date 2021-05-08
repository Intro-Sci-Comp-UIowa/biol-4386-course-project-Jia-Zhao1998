random_ggplot <- 
  function(data= WT_NoPi_NucOccupancy, chromosome="chr 1", start=1, end=1000){
  # data is a data frame; chromosome is a string/character and a column of data, start and end are integers
    sub_data <- data[data$chromosome == chromosome,]
    sub_data <- sub_data[sub_data$position >= start & sub_data$position <= end,]
    ggplot(data = sub_data, aes(x = position, y = score)) + theme_bw() + geom_line() + geom_point()
  }
