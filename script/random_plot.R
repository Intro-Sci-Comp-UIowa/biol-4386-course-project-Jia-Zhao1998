random_plot <- function(data= final_table, chromosome="chr 1", start=1, end=1000){
  # data is a data frame; chromosome is a string/character and a column of data, start and end are integers
  sub_data <- data[data$chromosome == chromosome,]
  position <- as.numeric(sub_data$position)
  sub_data <- sub_data[position >= start & position <= end,]
  with(sub_data, plot(position, data_value, pch = 19, xlab = "position", ylab= "Nucleosome Occupancy Score", type = "l"))
}