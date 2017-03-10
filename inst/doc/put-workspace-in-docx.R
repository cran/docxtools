## ------------------------------------------------------------------------
# packages used in the vignette
library(docxtools)

## ----fig.height = 0.75, echo = FALSE-------------------------------------
put_gap()

## ----fig.height = 0.25, fig.width = 7, echo = FALSE----------------------
put_gap(col = "black", fill = "gray")

## ---- fig.show = 'hold'--------------------------------------------------
# all 4 quadrants
put_axes(0)

## ---- fig.show = 'hold'--------------------------------------------------
# quadrant 2
put_axes(2)
# quadrant 1
put_axes(1, col = "blue", size = 2)

## ---- fig.show = 'hold'--------------------------------------------------
# quadrant 3
put_axes(3)
# quadrant 4
put_axes(4, col = "red", size = 2)

## ---- fig.show = 'hold', eval = FALSE------------------------------------
#  # two adjacent quadrants
#  put_axes(12)
#  # two adjacent quadrants
#  put_axes(41)

## ---- fig.height = 2, echo = FALSE---------------------------------------
put_axes()

## ---- fig.height = 2-----------------------------------------------------
library(ggplot2)
put_axes() +
	coord_fixed(1/2) # ratio of y/x

## ---- fig.show = 'hold'--------------------------------------------------
p <- put_axes() + 
	annotate("text", x = 0.5, y = 0.5, label = "quadrant I")
p	

## ------------------------------------------------------------------------
p <- put_axes() + 
	annotate("text", x = c(1, 0), y = c(0, 1)
		, label = c("x", "y")
		, vjust = c(1, 0.5)
		, hjust = c(1, 1.5)
		, fontface = "italic"
		)
p

## ------------------------------------------------------------------------
p <- put_axes() + 
	theme(axis.title = element_text()) + 
	labs(x = "new x", y = "new y")
p

## ------------------------------------------------------------------------
p <- put_axes(2) + 
	annotate("text", x = c(-1, 0), y = c(0, 1)
		, label = c("Re", "Im")
		, vjust = c(1.5, 0.5)
		, hjust = c(0, -0.5)
		, fontface = "italic"
		) + # top, right, bottom, left
		theme(plot.margin = unit(c(0, 5, 2, 0), "mm")) 

# override clipping
library(grid)
pp <- ggplot_gtable(ggplot_build(p))
pp$layout$clip[pp$layout$name == "panel"] <- "off"
grid.draw(pp)

