# General C++ notes

<details>
    <summary>
        Using a function(function pointer) as a member variable :
    </summary>
    
    You have a class implementing some pipeline, that may take one of many preprocessing functions to be part of its pipeline, based on the user's choice. 

    if all the options are included in the class definition, The class definition becomes unreadable. 

    i.e in reference to the Single responsibility principle of SOLID.

    example : 

```cpp
class pipeline{

    /*defining the function pointer of the signature of a preprocessor
    i.e A preprocessor that takes 2 integers and returns 1 integer.*/
    typedef int (*preprocessorMethod)(int, int);

    int a, b;
    char* csvOutPath[256];
    preprocessorMethod processor;

    public:
        featureExtractor( preprocessorMethod processor ){
            a = 2;
            b = 3;
            this->processor = processor; 
        }

        int getval(){
            int c = processor(a,b);
            return c; 
        }
};

int add(int a, int b){
    return a+b;
}

int subtract(int a, int b){
    return a-b;
}


int main(int argc, char *argv[]) {

    pipeline testpipeline{subtract};

    int a = testfptr.getval();

    std::cout<< "\n function poineter a parameter test : " << a;

    return(0);
}
```

</details>

<details>
    <summary>
    defining reusable classes
    </summary>
Most often, classes are defined in header files of the same name as the class, and any member functions defined outside of the class are put in a . cpp file of the same name as the class  

<a href="https://www.learncpp.com/cpp-tutorial/classes-and-header-files/">learncpp discusses this</a>
</details>

