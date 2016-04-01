## Exercise 2

### Instructions:

First, change directory to the Ex2 root directory:

     # cd W205/Ex2/

Initialize the database:

     # psql -d Tcount -U postgres -f init.sql

Run the application:

     # streamparse run

View total wordcount results:

     # python finalresults.py

View individual wordcount results:

     # python finalresults.py hello

Print the words that appear between k1 and k2 times:

     # python histogram.py 25,35
