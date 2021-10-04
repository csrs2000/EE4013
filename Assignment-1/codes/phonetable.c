#include <stdio.h>
#include <stdlib.h>
#include<string.h>

/*
 * A simple phonebook application.  Stores names/phone numbers in memory.
 * User can add, delete, or list names in the phone book.  The entries
 * are maintained in alphabetical by name.  The contents of the phone
 * book are not written to disk when the program is terminated.
 */
/*
 * phonebook.h
 */


/*
 * Constants/structure definitions for the phonebook application.
 */


/* Capacity of the phonebook */


#define CAPACITY 100


/* User commands */


#define ADD 'a'
#define DELETE 'd'
#define FIND   'f'
#define LIST   'l'
#define QUIT   'q'


#define NAME_LEN 80
#define NUMBER_LEN 40


/* In memory representation of an entry in the phonebook. */


typedef struct {
  char name[ NAME_LEN ];
  char number[ NUMBER_LEN ];
} phone_record;


/* Procedures in phonebook.c */


char get_command( void );
phone_record *get_record( void );
void add_record( phone_record *new_record );
void list_phonebook( void );
void find_name( char *name );
void delete_name( char *name );


int num_entries;           // Number of entries currently in the phone book
phone_record **phonebook;  // Where the names are stored


int main( int argc, char **argv ) {
  char ch;
  char name[ NAME_LEN ];
  char confirm[ 10 ];
  phone_record *rec;
  int loc;


  // Create an empty phonebook
  phonebook = (phone_record **)malloc( sizeof( phone_record *) * CAPACITY );
  num_entries = 0;


  // Read commands until the user gets tired
  while ( ( ch = get_command() ) != QUIT ) {
    switch( ch ) {
      case ADD:
        // Get new info
        rec = get_record();


	add_record(rec);
        break;


      case DELETE:


        break;


      case FIND:
        // Name to find
        printf( "Name:  " );
        scanf( "%s", name );


        // Look for the name
		find_name(name);
        break;


      case LIST:
        // List the phonebook
        list_phonebook();
        break;
    }
  }
}


/* 
 * Read and return a command from the keyboard. 
 */
char get_command() {
  char line[ 80 ];


  do {
    // Get input
    printf( "Press 'a' for adding record\n'd' for deleting record\n'f' for finding record\n'l' for dispalying records\n'q' for quitting\n" );


    // scanf returns -1 when it encoutners EOF - pretend we saw quit
    if ( scanf( "%s", line ) == -1 ) {
      line[ 0 ] = QUIT;
      printf( "\n" );  // Add new line so terminal looks nice
    }
  
    // Verify input (lightly)
    switch( line[ 0 ] ) {
      case ADD:
      case DELETE:
      case FIND:
      case LIST:
      case QUIT:
        break;
      default:
        printf( "Unrecognized command\n" );
        line[ 0 ] = 0;
    }
  } while ( line[ 0 ] == 0 );


  return line[ 0 ];
}


/*
 * Add a new record to the phonebook.
 */
void add_record( phone_record *new_record ) {
  int cur;


  // Make sure there is room
  if ( num_entries == CAPACITY ) {
    printf( "Sorry phonebook is full\n" );
  }
  else {
    // Insertion sort.  Start at bottom and copy elements down one until
    // you find the first one less than what we are adding or we hit the
    // top of the phonebook
    for ( cur = num_entries; 
          cur > 0 && strcmp( phonebook[ cur - 1 ]->name, new_record->name ) > 0;
          cur = cur - 1 ) {


      phonebook[ cur ] = phonebook[ cur - 1 ];
    }


    // Add the entry in the open slot
    phonebook[ cur ] = new_record;
    num_entries = num_entries + 1;
  }
}


/*
 * List the entries in the phonebook.
 */
void list_phonebook() {
  int i;


  if ( num_entries != 0 ) {
    printf( "Name\t\tNumber\n" );
    printf( "----\t\t------\n" );


    for ( i = 0; i < num_entries; i = i + 1 ) {
      printf( "%s\t\t%s\n", phonebook[ i ]->name, phonebook[ i ]->number );
    }
  }
  else {
    printf( "There are no entries in the phonebook\n" );
  }
}


/*
 * Delete the specified name from the phonebook.
 */
void delete_name( char *name ) {
  int found;
  int i;


  // Start at the top looking for the record to delete.  Once it is
  // found starting moving elements in the phonebook up one
  // position.
  for ( i = 0, found = 0; i < num_entries; i = i + 1 ) {
    if ( !found ) {
      found = strcmp( name, phonebook[ i ]->name ) == 0;
    }
    else {
      phonebook[ i - 1 ] = phonebook[ i ];
    }
  }


  if ( found ) num_entries = num_entries - 1;
}


/*
 * Find a name in the phonebook.  -1 means it is not there.
 */
void find_name( char *name ) {




  int i;


  if ( num_entries != 0 ) {
    printf( "Name\t\tNumber\n" );
    printf( "----\t\t------\n" );


    for ( i = 0; i < num_entries; i = i + 1 ) {
    	if ( strcmp( name, phonebook[ i ]->name ) == 0 )
      printf( "%s\t\t%s\n", phonebook[ i ]->name, phonebook[ i ]->number );
    }
  }
  else {
    printf( "There are no entries in the phonebook\n" );
  }
}


/*
 * Read and return a phone record from the keyboard.
 */
phone_record *get_record() {
  phone_record *rec;
  char *name;
  char *number;


  // Allocate storage for the phone record.  Since we want the record
  // to live after the function returns we need to use malloc
  rec = (phone_record *)malloc( sizeof( phone_record ) );


  // Get the data
  printf( "Name:  " );
  scanf( "%s", rec->name );


  printf( "Phone:  " );
  scanf( "%s", rec->number );


  return rec;
}