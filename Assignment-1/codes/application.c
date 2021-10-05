#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 10

struct hash {
char name[20];
float marks;
int class;
struct hash* ptr;
};

struct hash *DICT[SIZE];

void makenull()
{
int i;

 for(i=1; i<=SIZE; i++)
 {
  DICT[i]=NULL; 
 }
}


int hash(int class)
{
 return(class%SIZE);
}

void insert()
{

char nam[20];
float mar;
int cl,i,index;
struct hash *oldptr;

printf("Enter the student name\n");
 scanf("%s",nam);

printf("Enter the marks\n");
 scanf("%f", &mar);

printf("Enter the class\n");
 scanf("%d",&cl);
 index=hash(cl);
 oldptr = DICT[index];
 DICT[index]= (struct hash *) malloc(sizeof (struct hash));
// DICT[index]->name[20]=nam[20];
 strcpy(DICT[index]->name, nam);
 DICT[index]->marks=mar;
 DICT[index]->class=cl;
 DICT[index]->ptr=oldptr;
}
void display()
{
int index,class,count;
struct hash *head;
printf("Enter the students class to display\n");
scanf("%d",&class);
count=0;
index=hash(class);
head= DICT[index];
while (head != NULL)
{
 printf("Name: %s\n",head->name);
 printf("Class: %d\n", head->class);
 printf("Marks: %f\n\n", head->marks);
 count++;
 head = head->ptr;
}
printf("The count of students in this class are: %d\n", count);
}
void search()
{
int index,class;
char ename[20];
struct hash *head;
printf("Enter the students class to display\n");
scanf("%d",&class);
index=hash(class);
head= DICT[index];
printf("Enter the student's name to be searched\n");
scanf("%s",ename);
while (head != NULL )
{
 if(! strcmp(head->name, ename))
 {
  printf("The name is: %s\n",head->name);
  printf("The class is: %d\n", head->class);
  printf("The marks are: %f\n", head->marks);
  break;
 }
 else{
  if (head != NULL)
  {
  head=head->ptr;
  }
  else
  printf("Student not found\n");
     }
}
}
void high()
{
int index,class;
float high;
struct hash *head;
printf("Enter the students class to check marks\n");
scanf("%d",&class);
index=hash(class);
head= DICT[index];
while (head != NULL)
{
 if(head->ptr != NULL)
 {
  if((head->marks) > (head->ptr->marks))
  {
   high=head->marks;
  }
  else
  {
   high=head->ptr->marks;
  }
 }
 if(head->ptr != NULL)
  head=head->ptr;
 else{
 printf("The highest marks in the class are: %f\n", high);
 break;
 }
 }
}
int main ()
{
int num,i,choice;
printf("Enter the number of students' details you want to enter\n");
scanf("%d",&num);
 makenull();
 for(i=0; i<num; i++)
 {
  insert();
 }
printf("Enter your choice\n");
printf("1->Display\n2->Search \n3->Find Highest\n4->Exit\n");
scanf("%d",&choice);
while(choice!=4)
{
switch(choice)
{
 case 1: display();
  break;
 case 2: search();
  break;
 case 3: high();
  break;
 case 4: exit(0);
}
printf("Enter your choice\n");
printf("1->Display\n2->Search \n3->Find Highest\n4->Exit\n");
scanf("%d",&choice);
}
return 0;
}

 
