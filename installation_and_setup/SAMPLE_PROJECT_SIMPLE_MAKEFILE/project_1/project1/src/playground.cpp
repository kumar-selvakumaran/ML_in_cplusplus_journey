
//############  TESTING VIDEO CAPABILITY    #######################
#include <iostream> // for standard I/O
#include <string>   // for strings
#include <boost/algorithm/string.hpp>
#include <map>
// #include <opencv2/core/core.hpp>     // Basic OpenCV structures (cv::Mat)
// #include <opencv2/videoio.hpp>  // Video write
using namespace std;
// using namespace cv;


typedef std::map< int, char*>  split_dict;


split_dict get_string_dets( char* str)
{
    int strlen = 0;
    split_dict dir_dets;
    char a[] = {'q', 'w', 'e'};
    dir_dets[1] = a;
    return dir_dets;

}


int main(int argc, char **argv)
{
    char a[] = {'1','2','3'};

    string sample = "heys";
    for (string::iterator it=sample.begin() ; it != sample.end() ; it++)
    {
        cout << "\n iterator value : " << typeid(it).name();
    }
    split_dict test_dict =  get_string_dets(a);
    
    // for ( int i=0 ; i < argc ;  i++ )
    // {
    //     cout << ("\nargv [%d]", i) << argv[i] << "\n";
    // }

    // char* source;

    // cout << "\n\nenter a \'_\' joined string : "; 

    // cin >> source;

    // cout << "\ninputed string : "<< source;

    // for (i = )
    return 0;
}

//#######################################################################


// dictionaries : https://en.cppreference.com/w/cpp/container/map