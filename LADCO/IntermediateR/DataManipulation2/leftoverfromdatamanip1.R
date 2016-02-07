# Summarise rows with group_by() and summarise() {#summarise}

Suppose we want to summarise the value for each day in `airdata`. We can use the `substr()`
function to grab the first 8 characters of the "datetime" column. The `start` and `stop`
parameters are used to indicate which character is the starting position and which
is the stopping position.

```{r}
# for example
substr("20150101 00:00:00", start = 1, stop = 8)
```

We'll add a "date" column to `airdata`.

```{r}
airdata$date <- substr(airdata$datetime, 1, 8)
```

In base R, we can summarise the mean of each day by using the `tapply()` function (see `?tapply()`). Let's find the daily mean for a given site and a given parameter.

```{r}
ozone_site_A <- airdata[airdata$site == 840170311601 & airdata$parameter == 44201, ]
daily_mean <- tapply(ozone_site_A$value, ozone_site_A$date, mean, na.rm = TRUE)
head(daily_mean, 3)
```

To use `tapply()` you work with vectors. You have to supply the vector you want to apply the `mean()` function to (`ozone_site_A$value`), and you supply the vector that will be a factor for aggregation (`ozone_site_A$date`). 

`dplyr` accomplishes this task by allowing you to use data frames and their column names. The first step is to use the `group_by()` function to pick the columns that will be factors (groups will be created by
                                                                                                                                                                                       the levels of these columns).

```{r}
d_daily_mean <- group_by(airdata, site, parameter, date)
```

The `summarise()` function will split up the column by grouping together cells that have
common factor levels in the site, parameter, and date columns.

```{r}
d_daily_mean <- summarise(d_daily_mean, daily_mean = mean(value, na.rm = FALSE))
head(d_daily_mean, 3)
```

The resulting data frame has just four columns: site, parameter, date, and daily_mean.
Instead of limitting yourself to just one site and one parameter before calculating the daily mean,
`summarise()` allows you to take all of the grouping information from the `group_by` function and
calculate all of the daily values for each site and parameter.

```{r}
table(d_daily_mean[, c("site", "parameter")])
```
# `dplyr` classes {#classes}

The output of some `dplyr` functions aren't always strictly a `data.frame`. For instance, the output of the `group_by` function is an object with the following classes: `grouped_df`, `tbl_df`, `tbl`, and `data.frame`. This is something to be aware of, if you find your `dplyr` output won't behave the way
a `data.frame` normally should. An easy fix is to just turn it back into a
data frame using `as.data.frame()`

```{r}
class(d_daily_mean)
d_daily_mean <- as.data.frame(d_daily_mean)
class(d_daily_mean)
```
