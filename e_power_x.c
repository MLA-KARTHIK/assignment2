/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>

double factorial(double);
double multiply(double,double);
int main()
{
    double x=50;
    double a,b,c; 
    double fact;
    double mul;
    double res=1;
    int term;
    term=25;
    c=1;
    a=1;
 if(x!=0) 
{
    //printf("I entered if loop");
while(term!=0) 
{
    //printf("entered");
    fact=factorial(a);
    //printf("factorial value= %f\n", fact);
    mul=multiply(x,c);
    //printf("multiply value=%f\n",mul);
    c=c+1;
    a=a+1;
    //printf("c=%f",c);
    b=mul/fact;
    res=res+b;
    //printf("result=%f", res);
    term =term-1;
}   
 }
 
 else
 
 {
     res=1;
     
 }
 
 //fact=factorial();
printf("e power of x= %f", res);
    return 0;
}

double factorial(double p)
{
    double t, r;
    t=p;
    r=1;
    while(t!=1)
    {
         r=r*t;
         t=t-1;
    }
    return r;
}

double multiply(double p, double q)
{
    double temp=1;
    while(q!=0)
    {
      temp=temp *p ; 
        q=q-1;
    }
    return temp;
}
