library(rvest)
library(xml2)
url <- "https://www.billboard.com/charts/hot-100"
hot100 <- read_html(url)

str(hot100)
body_nodes <- hot100%>%
  html_node("body")%>%
  html_children()
body_nodes

rank <- hot100 %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all("//span[contains(@class, 'chart-element__rank__number')]") %>% 
  rvest::html_text()
artist <- hot100 %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all("//span[contains(@class, 'chart-element__information__artist')]") %>% 
  rvest::html_text()
title <- hot100 %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all("//span[contains(@class, 'chart-element__information__song')]") %>% 
  rvest::html_text()

chart_df <- data.frame(rank, artist, title)
knitr::kable(chart_df%>% head(10))

get_chart <- function(date = Sys.Date(), positions = c(1:10), type = "hot-100"){
  #Get url from input and read html
  input <- paste0("https://www.billboard.com/charts/",type,"/",date)
  chart_page <- xml2::read_html(input)
  
  #scrape data
  rank <- chart_page %>% 
    rvest::html_nodes('body') %>% 
    xml2::xml_find_all("//span[contains(@class, 'chart-element__rank__number')]") %>% 
    rvest::html_text()
  artist <- chart_page %>% 
    rvest::html_nodes('body') %>% 
    xml2::xml_find_all("//span[contains(@class, 'chart-element__information__artist')]") %>% 
    rvest::html_text()
  title <- chart_page %>% 
    rvest::html_nodes('body') %>% 
    xml2::xml_find_all("//span[contains(@class, 'chart-element__information__song')]") %>% 
    rvest::html_text()
  
  #create data frame
  chart_df <- data.frame(rank, artist, title)
  chart_df <- chart_df%>%
    dplyr::filter(!is.na(rank), rank %in% positions)
  chart_df
}

test1975 <- get_chart(date = "1975-05-22", positions = 1:10, type = "hot-100")
test1975
