* Encoding: UTF-8.
* Encoding: UTF-8
*Version 29.0.2.0 (20)
Naming conventions for CROSS TABULATIONS results for further analysis
1. Ever circumcised women by country
2. Women ever slapped by an Intimate Partner in the Last 12 Months by country
3.  Women who have the final say on their healthcare by  country


*Load datset.
 GET
  FILE='C:\Users\t03in24\Desktop\ipums-ir-dataset.sav'.



DATASET ACTIVATE DataSet1.

CROSSTABS
  /TABLES= COUNTRY BY FCCIRC
  /FORMAT=AVALUE TABLES
  /CELLS=COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=COUNTRY BY DVPSLAPFQ
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL..


CROSSTABS
  /TABLES=COUNTRY BY DECFEMHCARE
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW COLUMN 
  /COUNT ROUND CELL.



*-----------------------------------------------------------------------.


*For data cleaning in excel
 1. remove:
     First 3 row headings
 2. Name col1: country
 3. Populate country column
 4. Filter and remove:
    - All row/col Totals
    - cols:
            Not in Universe col
            Missing 
    -rows: in count/% col
             Blank
             All rows except % within country (for fgm and ahcdm)
 5.Number format is Percentage
 
 


DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=COUNTRY BY  DVPSLAPFQ FCCIRC DECFEMHCARE
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.
