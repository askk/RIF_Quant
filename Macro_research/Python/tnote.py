import pandas as pd

#read in time series
tbill = pd.read_csv("P:\\Equities\\DATA\\DGS10.csv", index_col = 0, parse_dates = True)

#remove na values
tbill.dropna(inplace = True)

#calc tbill returns
periods = ['5d','10d', '20d', '40d','60d', '120d', '250d']
for period in periods:
    period_size = int(period[:-1])
    tbill[period] = tbill.VALUE.pct_change(period_size)

#remove the nan row entries
tbill.dropna(how = 'any', inplace = True)


for i in periods:
    tbill[i] = tbill[i] * 1000
    