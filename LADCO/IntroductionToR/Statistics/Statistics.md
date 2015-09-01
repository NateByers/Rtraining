Basic Statistics
========================================================
author: 
date: 
navigation: section


Topics
========================================================

- [Descriptive statistics](#/descriptive)
- [Correlations](#/correlations)
- [t-stests](#/t-tests)
- [Nonparametric tests](#/nonparametric)


Descriptive Statistics
========================================================
type: section
id: descriptive

Descriptive Statistics
========================================================

- R has self-explanatory functions for descriptive stats
- `mean()`, `median()`, `sd()` 
- Remember to use `na.rm = TRUE` if you have `NA`s

Descriptive Statistics
=======================================================


```r
library(region5air)
data(chicago_air)
mean(chicago_air$ozone, na.rm = TRUE)
```

```
[1] 0.03567257
```

Descriptive Statistics
========================================================

- It is also easy to get sums and means of the columns or rows
in a `data.frame` using `colSums()`, `rowSums()`, `colmeans()`
and `rowMeans()`


```r
colMeans(chicago_air[, 2:4], na.rm = TRUE)
```

```
      ozone        temp       solar 
 0.03567257 54.83984375  0.85093151 
```

Descriptive Statistics
========================================================

- The same output can be obtained using `sapply()`


```r
sapply(chicago_air[, 2:4], sd, na.rm = TRUE)
```

```
      ozone        temp       solar 
 0.01370426 20.85152306  0.40513637 
```

- The first argument is the data frame, the second is the function to
apply to each column, and the third is an argument that is passed to the function

Descriptive Statistics
===========================================================

- Use the `quantile()` function to get quantiles


```r
quantile(chicago_air$ozone, 
         probs = c(0, .25, .5, .75, 1),
         na.rm = TRUE)
```

```
   0%   25%   50%   75%  100% 
0.004 0.025 0.034 0.045 0.081 
```


Descriptive Statistics
==========================================================

- You can also get a quick overview of summary statistics using the 
`summary()` function


```r
summary(chicago_air[, 2:4])
```

```
     ozone             temp            solar       
 Min.   :0.0040   Min.   :-17.00   Min.   :0.0400  
 1st Qu.:0.0250   1st Qu.: 36.75   1st Qu.:0.5300  
 Median :0.0340   Median : 59.50   Median :0.9100  
 Mean   :0.0357   Mean   : 54.84   Mean   :0.8509  
 3rd Qu.:0.0450   3rd Qu.: 73.00   3rd Qu.:1.2000  
 Max.   :0.0810   Max.   : 92.00   Max.   :1.4900  
 NA's   :391      NA's   :474                      
```

Descriptive Statistics
========================================================

- For data that are not continuous numeric values, it's useful to get the frequency
of certain values in your data set

- Here we look at the monitors and parameters in `airdata` 


```r
data(airdata)
table(airdata[, c("site", "parameter")])
```

Descriptive Statistics
========================================================


```
              parameter
site           44201 62101 88101
  840170310001 14331     0     0
  840170310032 10076     0     0
  840170310064  6869     0     0
  840170310076 16753     0     0
  840170311003  9336     0     0
  840170311601 16905     0     0
  840170313103 14418     0     0
  840170314002 14764     0     0
  840170314007 12245     0     0
  840170314201 15883  2275     0
  840170317002 12213     0     0
  840170436001 11321     0     0
  840170890005 16368     0     0
  840170971007 16868  6528     0
  840171110001 17317     0     0
  840171971011 16513     0     0
  840180730004     0  6399     0
  840180890022  8449  6482 16530
  840180890030  8646     0     0
  840180892004     0     0  9139
  840180892008  8441  6439     0
  840181270011     0  6491     0
  840181270024  8445     0 15859
  840181270026  8654     0     0
  840550590019 10651  6532     0
  840550590025  9199   256     0
  END OF FILE      0     0     0
```

Correlations
========================================================
type: section
id: correlations

Correlations
========================================================

- Use the `cor()` function to produce correlations


```r
cor(chicago_air[, 2:4], use = "complete.obs")
```

```
          ozone      temp     solar
ozone 1.0000000 0.6035925 0.5926064
temp  0.6035925 1.0000000 0.4923545
solar 0.5926064 0.4923545 1.0000000
```

- `use = "complete.obs"` tells the function to just use records that
are complete, i.e. no `NA`s

Correlations
========================================================

- Use `cor(X, Y)` to get the correlations between the columns of 
two data frames `X` and `Y`




```
Error in `[.data.frame`(airdata, , c("month", "weekday")) : 
  undefined columns selected
```
