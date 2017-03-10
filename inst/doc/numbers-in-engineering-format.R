## ------------------------------------------------------------------------
library(knitr)
opts_knit$set(root.dir = "../")
suppressPackageStartupMessages(library(dplyr))
library(docxtools)

## ------------------------------------------------------------------------
# temperature in K
T_K  <- c(294.05, 294.15, 294.65, 293.35, 293.85)
# convert pressure from hPa to Pa
p_Pa <- c(1011, 1010, 1011, 1010, 1011) * 100
# gas constant in J / (kg K)
R    <- 287
# density in kg / m^3
density_data <- data.frame(T_K, p_Pa, R)

## ------------------------------------------------------------------------
density_data <-	mutate(density_data, density = p_Pa / (R * T_K))
knitr::kable(density_data)

## ------------------------------------------------------------------------
engr_density_data <- format_engr(density_data, sigdig = c(5, 4, 0, 5))

## ---- collapse = TRUE----------------------------------------------------
str(engr_density_data)

## ------------------------------------------------------------------------
knitr::kable(engr_density_data)

## ------------------------------------------------------------------------
align_pander(engr_density_data, align_idx = "cccc")

## ------------------------------------------------------------------------
names(engr_density_data) <- c("$T\\text{ (K)}$"
	, "$p\\text{ (Pa)}$"
	, "$R\\text{ (J kg}^{-1}\\text{ K}^{-1}\\text{)}$"
	, "$\\rho\\text{ (kg/m}^{3}\\text{)}$"
	)

## ------------------------------------------------------------------------
align_pander(engr_density_data, "cccc", caption = "Air density measurements")

## ------------------------------------------------------------------------
# create test input arguments
set.seed(20161221)
n  <- 5
a  <- sample(letters, n)
b  <- sample(letters, n)
x  <- runif(n, min =  -5, max =  50) * 1e+5
y  <- runif(n, min = -25, max =  40) / 1e+3
z  <- runif(n, min =  -5, max = 100)
alpha_num <- data.frame(z, b, y, a, x, stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
engr_alpha_num <- format_engr(alpha_num)
align_pander(engr_alpha_num, "rcrcr")

## ------------------------------------------------------------------------
alpha_num <- select(alpha_num, a, b, x, y, z)
engr_alpha_num <- format_engr(alpha_num)
align_pander(engr_alpha_num, "ccrrr")

## ----collapse = TRUE-----------------------------------------------------
y2 <- alpha_num$y[2]
y2

## ----collapse = TRUE-----------------------------------------------------
z2 <- alpha_num$z[2]
z2

## ---- collapse = TRUE----------------------------------------------------
str(y2)

## ---- collapse = TRUE----------------------------------------------------
engr_y2 <- format_engr(y2, 4)
str(engr_y2)

## ---- collapse = TRUE----------------------------------------------------
# the x array
cat(x, sep = "\n")
class(x)

# formatted 
engr_x <- format_engr(x, 3)
class(engr_x)
engr_x

