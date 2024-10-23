#!/bin/sh
cat ./creates/createDB.sql | PGPASSWORD=postgres psql -h localhost -U postgres -d postgres;
echo "\nDatabase has been successuly create! \n";
cat ./creates/create_table_script.sql | PGPASSWORD=postgres psql -h localhost -U postgres -d book_crossing;
cat ./inserts/insert_standart_data.sql  | PGPASSWORD=postgres psql -h localhost -U postgres -d book_crossing;
echo "\nThe Tables are created and filled with standart data! \n";

while true; do
	read -r -p "Do you wish fill the database with test data? (Y/N): " approv
    	case $approv in
        	[Yy]* ) 
        	cat ./inserts/insert_test_data.sql | PGPASSWORD=postgres psql -h localhost -U postgres -d book_crossing;
        	echo "Test data is download!";
        
        	break;;
        	[Nn]* ) exit;;
        	* ) echo "Please answer Y or N.";;
    esac
done
