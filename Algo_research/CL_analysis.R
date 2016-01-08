#returns distribution analyis

#import CL
CL <- read.csv("E:\\RIF_Quant\\Algo_research\\Futures Data\\SCF-CME_CL1_FW.csv")

# compute log returns
returns <- diff(log(CL$Settle))
#plot-4-ranges function

plot_4_ranges <- name <- function(data, start_date, end_date, title) {

  #set the plot window to be 2X2
  par(mfrow=c(2,2))
  
  for (i in 1:4) {
    #create string ith date range
    range <- paste(start_date[i],"::",end_date[i],sep = ',')
    
    time_series <- data[range]
    
    mean_data <- round(mean(time_series, nna.rm = TRUE), 3)
    sd_data <- round(sd(time_series, na.rm = TRUE),3)
    
    hist_title <- paste(title,range)
    hist(time_series, breaks = 100, prob = TRUE, x_lab = '', 
         main = hist_title, cex.main = 0.8)
    legend('topright', cex = 0.7, bty = 'n',
           paste('mean=',mean_data,'sd=',sd_data))
  }
  par(mfrow=c(1,1))
}

begin_dates = c('1983-03-31','1991-01-01','1999-01-01','2007-01-01')
end_dates = c('1990-12-31','1998-12-31','2006-12-31','2015-10-07')

plot_4_ranges(CL$Settle, begin_dates, end_dates, 'CL prices for:')
