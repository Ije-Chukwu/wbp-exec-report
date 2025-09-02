* Encoding: UTF-8.
* Encoding: UTF-8
*Version 29.0.2.0 (20)
Naming conventions for CROSS TABULATIONS count results for further analysis
1.  Sheet1: ipv: Women ever slapped by Partner in the Last 12 Months by country
2.  Sheet2: fgm: Ever circumcised women by country
3.  Sheet3: ahcdm: Women who have the final say on their healthcare by  country


*Load datset.
 GET
  FILE='C:\Users\t03in24\Desktop\ipums-ir-dataset.sav'.


DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=COUNTRY BY  DVPSLAPFQ FCCIRC DECFEMHCARE
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.



*-----------------------------------------------------------------------.


*For data cleaning in r
 1. remove:
     rows 1-3,last
     col1,last
 2. rename col2: country
 3. Populate country column
 4. Filter and remove:
    - cols:
             Missing
            Not in Universe col
 
 



