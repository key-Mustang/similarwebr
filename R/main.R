#' Get domain visits
#'
#' @param api_key similarweb API key
#' @param domain domain of interest, do not include schemas like `www.` or `https:`
#' @param gr \code{monthly, weekly} or \code{daily}
#' @param start start date \code{MM-YYYY}
#' @param end end date \code{MM-YYYY}
#' @param md Defaults to False, set to True if you want main domain only
#'
#' @return The \code{curl} object with \code{status_code, headers, content} etc.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_visits(api_key = "my_api_key", domain = "cnn.com", start = "01-2016", end = "03-2016", gr = "monthly")
#' }
get_visits <- function(api_key, domain, start, end, gr, md = "False") {

  request = paste0("https://api.similarweb.com/v1/website/", domain,
                   "/total-traffic-and-engagement/visits?api_key=", api_key,
                   "&start_date=", start,
                   "&end_date=", end,
                   "&main_domain_only=", md,
                   "&granularity=", gr)

  response <- curl::curl_fetch_memory(request)
  code <- response$status_code

  if (code == 200){
    cat("\nrequest sent successfuly")
  } else {
    return(list("domain" = domain, "status_code" = code, "timestamp" = Sys.time()))
  }

  response
}


#' Format visits response
#'
#' @param response the \code{curl} object recieved as a response from \code{get_visits}
#'
#' @return \code{data.frame} with status, domain, date, visits and timestamp
#'
#' @export
#'
#' @examples
#' \dontrun{
#' format_visits(response =
#'   get_visits("my_email", token = "my_token", domain = "facebook.com"))
#' }
format_visits <- function(response) {

  # request failed
  if (response$status_code > 200) {
    cat("\nprevious response failed!\n")
    failed_response <- data.frame(date = NA,
                                  visits = NA,
                                  status = response$status_code,
                                  domain = response$domain,
                                  granularity = NA,
                                  timestamp = Sys.time())
    return(failed_response)
  }

  df <- jsonlite::fromJSON(rawToChar(response$content), simplifyDataFrame = TRUE, flatten = TRUE)
  visits <- data.frame(df$visits)
  visits$status <- df$meta$status
  visits$domain <- df$meta$request$domain
  visits$granularity <- df$meta$request$granularity
  visits$timestamp <- Sys.time()

  visits
}



#' Get category rank
#'
#' @param api_key similarweb API key
#' @param domain domain of interest, do not include schemas like `www.` or `https:`
#'
#' @return The \code{curl} object with \code{category, rank}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_category_rank(api_key = "my_api_key", domain = "facebook.com")
#' }
get_category_rank <- function(api_key, domain) {

  request = paste0("https://api.similarweb.com/v1/website/", domain,
                   "/category-rank/category-rank?api_key=", api_key)

  response <- curl::curl_fetch_memory(request)
  code <- response$status_code

  if (code == 200){
    cat("\nrequest sent successfuly")
  } else {
    return(list("domain" = domain, "status_code" = code, "timestamp" = Sys.time()))
  }

  response
}


#' Format category-rank response
#'
#' @param response the \code{curl} object recieved as a response from \code{get_category_rank}
#'
#' @return \code{data.frame} with status_code, domain, category, category rank and timestamp
#'
#' @export
#'
#' @examples
#' \dontrun{
#' format_visits(response =
#'   get_visits("my_email", token = "my_token", domain = "facebook.com"))
#' }
format_category_rank <- function(response) {

  # request failed
  if (response$status_code > 200) {
    cat("\nprevious response failed!\n")
    failed_response <- data.frame(status = response$status_code,
                                  domain = response$domain,
                                  category = NA,
                                  category_rank = NA,
                                  timestamp = Sys.time())
    return(failed_response)
  }

  df <- jsonlite::fromJSON(rawToChar(response$content), simplifyDataFrame = TRUE, flatten = TRUE)

  # return format: domain,category,category_rank,timestamp
  data.frame(status = df$meta$status, domain = df$meta$request$domain, category = df$category, category_rank = df$rank, timestamp = Sys.time())

}


#' Get rank and reach
#'
#' @param api_key similarweb API key
#' @param domain domain of interest, do not include schemas like `www.` or `https:`
#'
#' @return The \code{curl} object with overall \code{rank} and reach information
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_rank_and_reach(api_key = "my_api_key", domain = "google.com")
#' }
get_rank_and_reach <- function(api_key, domain) {

  request = paste0("https://api.similarweb.com/Site/", domain,
                   "/v1/traffic?Format=JSON&UserKey=", api_key)

  response <- curl::curl_fetch_memory(request)
  code <- response$status_code

  if (code == 200){
    cat("\nrequest sent successfuly")
  } else {
    return(list("domain" = domain, "status_code" = code, "timestamp" = Sys.time()))
  }

  response
}



#' Get similar websites
#'
#' @param api_key similarweb API key
#' @param domain domain of interest, do not include schemas like `www.` or `https:`
#' @param start_month date in the format YYYY-MM
#' @param end_month date in the format YYYY-MM
#'
#' @return The \code{curl} object with overall 40 most similar sites, global ranking, category, and category ranking
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_similar_websites(api_key = "my_api_key", domain = "coinmarketcap.com", start_month = "2018-01", end_month = "2018-02")
#' }
get_similar_websites <- function(api_key, domain, start_month, end_month) {

  request = paste0("https://api.similarweb.com/v1/website/", domain,
                   "/similar-sites/similarsites?api_key=", api_key,
                   "&start_date=", start_month,
                   "&end_date=", end_month)

  response <- curl::curl_fetch_memory(request)
  code <- response$status_code

  if (code == 200){
    cat("\nrequest sent successfuly")
  } else {
    return(list("domain" = domain, "status_code" = code, "timestamp" = Sys.time()))
  }

  response
}

