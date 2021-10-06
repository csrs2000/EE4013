#include <iostream>
#include<string>
using namespace std;
  
// Class to store contact
// details
class node {
    string name;
    long int tel;
    int id;
  
public:
    node()
    {
        tel = 0;
        id = 0;
    }
    friend class hashing;
};
  
class hashing {
  
    // Maximum size of
    // directory is 1000
    node data[1000];
    string n;
    long int t;
    int i, index;
  
public:
    hashing()
    {
        i = 0;
        t = 0;
    }
  
    // This method takes details
    // from the user like ID,
    // Name and Telephone number
    // and create new record in
    // the hashtable.
    void create_record(int size,int i,string name,long int number)
    {
       
        index = i % size;
  
        // Inserting record using linear
        // probing in case of collision
        for (int j = 0; j < size; j++) {
            if (data[index].id == 0) {
                data[index].id = i;
                data[index].name = name;
                data[index].tel = number;
                break;
            }
            else
            {
                cout<<"collision\n";
                index= (index + 1) % size;
                
            }
        }
    }
  
    // This method takes the key of
    // the record to be searched.
    // Then, it traverses the hash
    // table, if record id matches
    // with the key it displays the
    // record detail.
    void search_record(int size,int key)
    {
        int index1,flag = 0;
        index1= key % size;
  
        // Traversing the directory
        // linearly inorder to search
        // record detail
        for (int a = 0; a < size; a++) {
            if (data[index1].id == key) {
                flag = 1;
                cout << "\nRecord found:";
                cout << "\n\tID ";
                cout << "\tNAME ";
                cout << "\t\tTELEPHONE ";
                cout << "\n\t"
                     << data[index1].id
                     << " \t"
                     << data[index1].name
                     << " \t"
                     << data[index1].tel;
                break;
            }
            else
                index1
                    = (index1 + 1) % size;
        }
        if (flag == 0)
            cout << "\nRecord not found";
    }
  
    // This method takes the key
    // of the record to be deleted.
    // Then, it searches in hash
    // table if record id matches
    // with the key. Then, that
    // record is deleted.
    void delete_record(int size,int key)
    {
        int index1,flag = 0;
        index1 = key % size;
        // Traversing the directory
        // linearly inorder to delete
        // the record detail
        for (int a = 0; a < size; a++) {
            if (data[index1].id
                == key) {
                flag = 1;
                data[index1].id = 0;
                data[index1].name = " ";
                data[index1].tel = 0;
                cout << "\nRecord";
                cout << " deleted";
                cout << " successfully";
                break;
            }
            else
                index1
                    = (index1 + 1) % size;
        }
        if (flag == 0)
            cout << "\nRecord not found";
    }
  
    // This method takes the key
    // of the record to be searched.
    // Then, it traverses the hash table,
    // if record id matches with the
    // key then it displays the record
    // detail.
    void update_record(int size,int key,string name,long int number)
    {
        int index1,flag = 0;
        index1 = key % size;
        // Traversing the directory
        // linearly inorder to search
        // record detail
        for (int a = 0; a < size; a++) {
            if (data[index1].id
                == key) {
                flag = 1;
                break;
            }
            else
                index1
                    = (index1 + 1) % size;
        }
        // If the record is found
        // the details are updated
        if (flag == 1) {
            data[index1].name = name;
            data[index1].tel = number;
        }
    }
  
    // This function is created to
    // display all the record of
    // the diary.
    void display_record(int size)
    {
        // Displaying the details of
        // all records of the directory.
        for (int a = 0; a < size; a++) {
            if (data[a].id != 0) {
                cout << "\n\t"<<"ID:"
                     << data[a].id
                     << " \t"
                     << "Name:"<<data[a].name
                     << " \t"
                     << "Telephone number:"<<data[a].tel<<"\n";
            }
        }
    }
};
  
// Driver code
int main()
{
    // size of directory
    int size;
  
    // creating object of hashing
    // class
    hashing s;
    cout<<"enter the size of the hash table\n";
    cin>>size;
    int choice;
    cout<<"enter the option\n1-insert record\n2-display records\n3-search record\n4-update record\n5-delete record\n6-exit\n";
    cin>>choice;
    while(choice!=6)
    {
    if(choice==1)
    {
        int id;
        string name;
        long int number;
        cout<<"enter id\n";
        cin>>id;
        cout<<"enter name\n";
        cin>>name;
        cout<<"enter phone no\n";
        cin>>number;
        
        // Creating a record in
        // directory
        s.create_record(size,id,name,number);
    }
    else if(choice==2)
    {
    // Display available
    // record details
    
    s.display_record(size);
    }
    else  if(choice==3)
    {
    // Searching a record detail
    // in the directory
    int id;
    cout<<"enter the id to be searched\n";
    cin>>id;
    s.search_record(size,id);
    }
    else if(choice==4)
    {
    // Updating the existing
    // details of a record
    int id;
    string name;
    long int number;
    cout<<"enter id to be updated\n";
    cin>>id;
    cout<<"enter name\n";
    cin>>name;
    cout<<"enter telephone number\n";
    cin>>number;
    s.update_record(size,id,name,number);
    }
    else if(choice==5)
    {
    // Removing specified
    // existing record
    // from dictionary
    int id;
    cout<<"enter id to be deleted\n";
    cin>>id;
    s.delete_record(size,id);
    }
    else if(choice!=6)
    {
        cout<<"invalid choice,enter a valid option";
    }
    cout<<"enter the option\n1-insert record\n2-display records\n3-search record\n4-update record\n5-delete record\n6-exit\n";
    cin>>choice;
    }
    return 0;
}
