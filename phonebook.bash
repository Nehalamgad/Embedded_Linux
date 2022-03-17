
#!/bin/bash

if [ "$#" -eq  "0" ]
   then
     echo "Run with those argument"
     echo "To insert insert new contact run with -i "
     echo "To View all contacts details run with -v "
     echo "To search by contact name run with -s "
     echo "To delete all records run with -e "
     echo "To delete one contact name run with -d "
     
 fi


while test $# -gt 0
do
    case "$1" in
    	#to insert new contact
        -i)
        	read -p "Enter your name: " name 
        	read -p "Enter your Number: " number 
        	#to search without case sensitive , and not print the result in terminal (-iq) to check the duplication
        	if  grep -iq "$name" contacts.txt
        	then
        		echo "Duplication contact info"	
        	else
        		echo "Name is: ""$name --" " Number is: ""$number">> contacts.txt
        	
        	fi
        	;;
	#to view all contacts         
        -v) 
            	#to check if the file is empty or not
            	if [ -s contacts.txt ];
            	 then
       		 # The file is not-empty.
			cat contacts.txt		
		else
			# The file is empty.	
			echo "File is empty"
		fi
            	
            	;;
           
           #to search the contact 	
        -s) 
        	read -p "Enter the name you search for: " search
        	#check if the name exist in file or not 
        	if  grep -iq "$search" contacts.txt
        	then
        		grep -i ${search} contacts.txt
        		#echo "Found" 
        	else
        		echo "Doesn't exist"
        	fi
        	;;
        	
        #delete all contacts info	
        -e)
           	 echo -n "" > contacts.txt
            	
            	;;
            	
         #delete just choiced one
        -d)
         	read -p "Enter the name you want to delete: " delete
        	 if grep -qio "$delete" contacts.txt
			then
			    # delete contact if exist 
			   sed -i "/$delete/d" contacts.txt
			else
			    # error
			    echo "The contact is not exist!"
			fi
        	
        	;;           
    esac

    shift
done




