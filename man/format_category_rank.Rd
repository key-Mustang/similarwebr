% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{format_category_rank}
\alias{format_category_rank}
\title{Format category-rank response}
\usage{
format_category_rank(response)
}
\arguments{
\item{response}{the \code{curl} object recieved as a response from \code{get_category_rank}}
}
\value{
\code{data.frame} with status_code, domain, category, category rank and timestamp
}
\description{
Format category-rank response
}
\examples{
\dontrun{
format_visits(response =
  get_visits("my_email", token = "my_token", domain = "facebook.com"))
}
}
