% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Geoms.R
\docType{data}
\encoding{UTF-8}
\name{GeomSpotlight}
\alias{GeomSpotlight}
\alias{geom_spotlight}
\title{Automatically enclose points in a polygon}
\usage{
geom_spotlight(mapping = NULL, data = NULL, stat = "identity",
  position = "identity", na.rm = FALSE, show.legend = NA,
  inherit.aes = TRUE, ...)
}
\arguments{
\item{mapping}{mapping}

\item{data}{data}

\item{stat}{stat}

\item{position}{position}

\item{na.rm}{na.rm}

\item{show.legend}{show.legend}

\item{inherit.aes}{inherit.aes}

\item{...}{dots}
}
\value{
adds a circle around the specified points
}
\description{
Automatically enclose points in a polygon
}
\examples{
d <- data.frame(x=c(1,1,2),y=c(1,2,2)*100)

gg <- ggplot(d,aes(x,y))
gg <- gg + scale_x_continuous(expand=c(0.5,1))
gg <- gg + scale_y_continuous(expand=c(0.5,1))
gg + geom_spotlight(s_shape=1, expand=0) + geom_point()


gg <- ggplot(mpg, aes(displ, hwy))
ss <- subset(mpg,hwy>29 & displ<3)
gg + geom_spotlight(data=ss, colour="blue", s_shape=.8, expand=0) +
geom_point() + geom_point(data=ss, colour="blue")

}
\keyword{datasets}
\keyword{ggplot2}

