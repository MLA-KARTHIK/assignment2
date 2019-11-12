/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>

double factorial(double);
double multiply(double,double);
double sine(double, double);
double cosine(double, double);
int main()
{
double a, b, res;
double a1, a2;
double term;
term=20;
double x;
x=1.570796;
a1=sine(x,term);
a2=cosine(x,term);
res=a1/a2;
printf("Tan(%f)=%f\n", x, res);
}

double sine(double p, double q)
{
    double b1,b2,b3,b4,b5,b6;
    int i;
    i=1;
    b1=p;
    b2=q;
    b3=1;
    double sine_res=0;
    while(b2!=0)
    {
       b4 = factorial(b3);
        b5= multiply(b1,b3);
        b3=b3+2;
        b2=b2-1;
        b6=b5/b4;
        if(i==1){
            //printf("I entered\n");
        sine_res=sine_res+b6;
        i=i-1;
        //printf("i=%i\n", i);
        }
        else
        {
           // printf("I didnot enter\n");
            sine_res=sine_res-b6;
            i=i+1;
            
        }
    }
    printf("sin(%f)=%f\n", b1, sine_res);
    return sine_res;
}

double cosine(double p, double q)
{
    double b1,b2,b3,b4,b5,b6;
    int i=1;
    b1=p;
    b2=q-1;
    b3=2;
    double cosine_res=1;
    while(b2!=0)
    {
       b4 = factorial(b3);
        b5= multiply(b1,b3);
        b3=b3+2;
        b2=b2-1;
        b6=b5/b4;
        if(i==1)
        {
        cosine_res=cosine_res-b6;
        i=i-1;
        }
        else{
            cosine_res=cosine_res+b6;
            i=i+1;
            
        }
    }
    printf("cosin(%f)=%f\n", b1, cosine_res);
    return cosine_res;
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
