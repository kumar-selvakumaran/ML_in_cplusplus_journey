// NAME : Kumar Selvakumaran
// DATE : 
// nuid : 002866892
// FUNCTION : To read an image from a file, and display it in a window.


#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>

using namespace std;
using namespace cv;


int main()
// the main function where:
//      1. The image is read into a opencv matrix object
//      2. The resolution of the image is printed in the console (additional)
//      3. The image is displayed in a window (required)
//      4. The user is prompted to either exit the program by pressing 'q' or to display another pressing another key
//      5. If the user presses a key other than 'q', then the user is prompted for the location of the next image to be displayed.
//      6. the process continuous, until the user presses 'q'
{
    bool exit_flag = false;
    
    string source = "../data/test.png";

    while(exit_flag != true){

    // Reading 
    Mat image = imread(source, IMREAD_COLOR);
    cout << image.size << endl;
    namedWindow("image display", WINDOW_NORMAL );
    imshow("image display", image );
    waitKey(0);

    char option;
    
    cout << "\n chose from the given options\n\n1. press 'q' to quit\n2. or any other key to display another image\t";
    cin >> option;
        
    if (option == 'q'){
        exit_flag = true;
        break;
    }
    else{
        cout << "\nenter image path : \t";
        cin >> source;
    }

    return 0;
    
    }
}

