##--------summarize_group_Cases_Manipulate_Cases-----
library(dplyr)
library(ggplot2)
df  = data.frame(mtcars)
df
# summarize function
df %>%  summarize(avg = mean(mpg))
# summarize all columns and print
df %>% count(cyl) #  will tel you the unique values
df %>% count(cyl, gear) # will tell you the unique values of cyl and gear
df %>% count(cyl, gear, wt) # will tell you the unique values of cyl, gear and wt 
df %>% count(cyl, gear, wt, mpg) # will tell you the unique values of cyl, gear, wt and mpg
# group by and summarize
df %>%  
  group_by(cyl) %>% 
  summarize(avg = mean(mpg))
# group by and summarize
df %>%  
  group_by(cyl, gear) %>% 
  summarize(avg = mean(mpg))
# group by and summarize
gp_mtcar <- df %>% group_by(cyl)
gp_mtcar
# plot the data
gp_mtcar %>% 
  ggplot(aes(x = cyl, y = mpg)) + 
  # color by cyl
  geom_point(aes(color = factor(cyl)))
# manipulate Cases
# filter, distinct, slice, arrange, slicce_sample, slice_min, slice_head
df %>% filter(mpg > 30) # filter the data
df %>% filter(mpg > 30, cyl == 4) # filter the data
df %>% filter(mpg > 30, cyl == 4) %>% 
  distinct() # filter the data and get distinct values
df %>% filter(mpg > 30, cyl == 4) %>% 
  distinct(cyl) # filter the data and get distinct values
df %>% filter(mpg > 30, cyl == 4) %>% 
  distinct(cyl, gear) # filter the data and get distinct values
df %>% filter(mpg > 30, cyl == 4) %>% 
  distinct(cyl, gear, wt) # filter the data and get distinct values
df %>% filter(mpg > 30, cyl == 4) %>% 
  distinct(cyl, gear, wt, mpg) # filter the data and get distinct values
df %>% filter(mpg > 30, cyl == 4) %>% 
  distinct(cyl, gear, wt, mpg) %>% 
  slice(1:5) # filter the data and get distinct values and slice the data
df %>% filter(mpg > 30, cyl == 4) %>% 
  distinct(cyl, gear, wt, mpg) %>% 
  slice(1:5) %>% 
  arrange(mpg) # filter the data and get distinct values and slice the data and arrange the data
# slice_sample
df %>% slice_sample(n = 5, replace = TRUE) # slice the data randomly)
# slice_min
df %>% slice_min(mpg, n = 5) # slice the data with minimum values
# slice_head
df %>% slice_tail(n=15) # slice the data with head values
?base::Logic
# logic operator table
y <- 1 + (x <- stats::rpois(50, lambda = 1.5) / 4 - 1)
x[(x > 0) & (x < 1)]    # all x values between 0 and 1
if (any(x == 0) || any(y == 0)) "zero encountered"

## construct truth tables :

x <- c(NA, FALSE, TRUE)
names(x) <- as.character(x)
outer(x, x, `&`) ## AND table
outer(x, x, `|`) ## OR  table
outer(x, x, `xor`) ## XOR table
outer(x, x, `==`) ## EQ  table
outer(x, x, `!=`) ## NEQ table


##--------Manipulate_variables_-----
# extract data
library(dplyr)
df <- data.frame(mtcars)
df
df_cyl <- df %>% pull(cyl)
df_cyl
df %>% select(mpg, cyl) # pull specific colummn as table
df_mof <- df %>% relocate(mpg, cyl, .after=last_col()) # move the column
df_mof # columns relocated to last side
# use helper with select() and across()
# contains(match), num_range(), all_of(), any_of(), everything()
# starts_with(), ends_with(), contains(), matches(), one_of()
# manipulatr muultiple variables at one 'across()' function
df %>% summarize(across(everything(), mean)) # summarize multiple variables
df %>% summarize(across(where(is.numeric), mean)) # summarize multiple variables
df %>% summarize(across(where(is.numeric), mean, na.rm = TRUE), 
                 across(where(is.character), n_distinct)) # summarize multiple variables
# c_across
df %>% rowwise() %>% 
  mutate(x_total = sum(c_across(1:2)))# add 1 to mpg and cyl
# make new variables
# use vectorized function
df %>% mutate(gpm = 1/mpg, .keep = None) # add new variable
df %>% mutate(gpm1 = 1/mpg, cyl = cyl*2) # add new variable
df %>% mutate(gpm2 = 1/mpg, cyl = cyl*2, wt = wt/2) # add new variable
df_mutated <- df %>% mutate(gpm3 = 1/mpg, cyl = cyl*2, wt = wt/2, gear = gear*3) # add new variable 
df_mutated
# rename data in mutated data
df_mutated %>% rename(gpm4 = gpm3, cyl4 = cyl, wt4 = wt, gear4 = gear) # rename the data
# summarize function
df %>% summarize(avg = (mpg))
# count factor
df_cy <- df %>% count(cyl) # count the factor
# create barplot of df_cy
library(ggplot2)
ggplot(df_cy, aes(x = factor(cyl), y = n)) + geom_bar(stat = "identity")
# group by and summarize
df_cy <-df %>% group_by(cyl) %>% 
  summarize(avg = mean(mpg)) # group by and summarize
ggplot(df_cy, aes(x = factor(cyl), y = avg)) + geom_bar(stat = "identity")
# rowwise function
df %>% rowwise() %>% 
  mutate(x_total = sum(c_across(1:2)))# add 1 to mpg and cyl

