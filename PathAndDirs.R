path<- system.file("extdata", package = "dslabs")
list.files(path)

filename<- "murders.csv"
fullpath<- file.path(path, filename)
fullpath

file.copy(fullpath, getwd())

list.files(getwd())