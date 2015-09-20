library(shiny)
# Run the app locally
runApp("Project")

# Deploy app on Rstudio's shiny server

library(shinyapps)
setAccountInfo(name='chuash', token='39C21DB26922F0DDF1806C15E7DC9C9F', secret='TYNkHsL1cY1lIcJe5yRSHmG4SdSc+AnYGf3iTske')
deployApp("Project")
