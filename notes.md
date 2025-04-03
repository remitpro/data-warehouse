# Data Warehouse 
Tajudeen Abdulazeez  `toabdula@syr.edu`
***
## Requirements Analysis
### Example of Business Questions 
* What type of routine analysis do you perform?
* What data are used and where did you get them?
* What did you do with the data once you get them?
* Which report do you use? which data on the report are important ?if the report are are dynamic, what will it do differently?
* Describe your products. How do you distinquish different product? how are they categorized? Do categories change overtime?

### Example of Functional Requirements gathered from the business users.
* Business users must be able to analyze sales of product over time and by geographic region, customer segment or sales teritory
* Business users must be able to view their financial data within their own department such as revenues and expenses by financial period broken down into account code.

### Example Non functional requirements gathered from the Business Users.
* The maximum query response time should be no longer than 20 seconds
* Extract from the accounting system can take place only on sundays between 5 and 6am.


### Data profiling
Exploring existing data to get a sense of:
* Technical feasibility of the project
* Structure and condition of the data
* Availability of the data source 
MIcosoft excel makes for a good profiling tool.


**Dimensional Models** : The process of building dimensional model from a business process. The dimensional model will eventualy becomne a star schema in your enterprise data warehouse.
* Identity the business process and business process type. These are `events`, `status`, or `levels`.
* Identify the `facts` of the business process. `Quantitative value we mesure`.
* Identify `attributes` in dimensions of the business process. The role by which we measure the bisiness process.

### Identifying the business process
* Events or `transation`
* Worflows based on objects status are called `accumalating snapshot`
* Quantitative measurements of point in time based on levels. `periodic snapshot`

### Identify the Dimensions and Attributes
* Dimensions provide context for our facts.
* We can easily identify dimensions because of the `by` and / or `for` words. e.g total accounts receivables for the IT department by month.
* Dimensions have attributes that describe and categorize their values. e.g student, major, year, doemitory, gender
* Attributes help contraints and summarize facts.

## Dimensional Model
* [High Level Dimensional Model]()



Prep 
- create a virtualenv 
- install dependencies 
 -  dbt-sqlserver
 -  dbt-core 


mkdocs 
https://www.mkdocs.org/getting-started/
- install mkdocs 
- initialize mkdocs 
- mkdocs new .
- pip install mkdocs-material
https://github.com/squidfunk/mkdocs-material/tree/master



Step 1: Create Azure Synapse Analytics
- Go to Azure Portal → Search "Azure Synapse Analytics"
- Click Create Synapse Workspace
- Choose SQL Pool (Dedicated or Serverless)
- Configure Networking & Security
- Click Review + Create


From the workspace's sidebar, select Data. Click the three dot menu on your database and select New SQL script to open the SQL editor.


Data 
s3://awssampledbuswest2/ssbgz/stgSongs/

s3://awssampledbuswest2/ssbgz/stgEvents/


aws s3 cp s3://awssampledbuswest2/ssbgz/stgSongs/ . --recursive




C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\


cp -r  target/ ../docs/dbtpipeline/

