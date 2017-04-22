# <p> dataMeta
An R package to create and append a data dictionary for an R dataset  

Datasets generally require a data dictionary that will incorporate information related to the dataset's variables and their descriptions, including the description of any variable options. This information is crucial, particularly when a dataset will be shared for further analyses. However, constructing it may be time-consuming. The `dataMeta` package has a collection of functions that are designed to construct a data dictionary that appended to the original dataset as an attribute, along with other information generally provided in other software as metadata. This information will include: the time and date when it was edited last, the user name, a main description of the dataset. Finally, the dataset is saved as an R dataset (.Rd).

```diff
Suggestions are most welcome!
```

<b>Install dataMeta in R from GitHub using devtools:</b>

```
install.packages("devtools")
library(devtools)
install_github("dmrodz/dataMeta")
```

<b>Feel free to view the vignette within the repo.</b>
