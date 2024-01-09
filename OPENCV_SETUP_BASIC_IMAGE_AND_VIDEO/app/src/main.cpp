//################  WORKING CODE FOR IMAGE , GUI TESTING ##########
// #include <opencv2/core/core.hpp>
// #include <opencv2/imgcodecs.hpp>
// #include <opencv2/highgui/highgui.hpp>
// #include <iostream>

// using namespace std;
// using namespace cv;

// int main()
// {
//     Mat image = imread("test.png", IMREAD_COLOR);
//     cout << image.size << endl;
//     imwrite("out.png",image);
//     namedWindow("TEST", WINDOW_NORMAL );
//     imshow("TEST", image );
//     waitKey(0);
//     return 0;
// }

//#################################################################

//############  TESTING VIDEO CAPABILITY    #######################
#include <iostream> // for standard I/O
#include <string>   // for strings
#include <opencv2/core/core.hpp>     // Basic OpenCV structures (cv::Mat)
#include <opencv2/videoio.hpp>  // Video write
using namespace std;
using namespace cv;
static void help()
{
    cout
        << "------------------------------------------------------------------------------" << endl
        << "This program shows how to write video files."                                   << endl
        << "You can extract the R or G or B color channel of the input video."              << endl
        << "Usage:"                                                                         << endl
        << "./video-write <input_video_name> [ R | G | B] [Y | N]"                          << endl
        << "------------------------------------------------------------------------------" << endl
        << endl;
}
int main()
{
    help();
    // if (argc != 4)
    // {
    //     cout << "Not enough parameters" << endl;
    //     return -1;
    // }
    const string source  = "testvid.mp4";           // the source file name
    const bool askOutputType = false;  // If false it will use the inputs codec type
    VideoCapture inputVideo(source);              // Open input
    if (!inputVideo.isOpened())
    {
        cout  << "Could not open the input video: " << source << endl;
        return -1;
    }
    string::size_type pAt = source.find_last_of('.');  // Find extension point    
    char choice= 'R';            
    const string NAME = source.substr(0, pAt) + choice + ".mp4";   // Form the new name with container
    int ex = static_cast<int>(inputVideo.get(CAP_PROP_FOURCC));     // Get Codec Type- Int form
    // Transform from int to char via Bitwise operators
    char EXT[] = {(char)(ex & 0XFF) , (char)((ex & 0XFF00) >> 8),(char)((ex & 0XFF0000) >> 16),(char)((ex & 0XFF000000) >> 24), 0};
    Size S = Size((int) inputVideo.get(CAP_PROP_FRAME_WIDTH),    // Acquire input size
                  (int) inputVideo.get(CAP_PROP_FRAME_HEIGHT));
    VideoWriter outputVideo;                                        // Open the output
    if (askOutputType)
        outputVideo.open(NAME, ex=-1, inputVideo.get(CAP_PROP_FPS), S, true);
    else
        outputVideo.open(NAME, ex, inputVideo.get(CAP_PROP_FPS), S, true);
    if (!outputVideo.isOpened())
    {
        cout  << "Could not open the output video for write: " << source << endl;
        return -1;
    }
    cout << "Input frame resolution: Width=" << S.width << "  Height=" << S.height
         << " of nr#: " << inputVideo.get(CAP_PROP_FRAME_COUNT) << endl;
    cout << "Input codec type: " << EXT << endl;
    int channel = 2; // Select the channel to save
    
    switch(choice)
    {
    case 'R' : channel = 2; break;
    case 'G' : channel = 1; break;
    case 'B' : channel = 0; break;
    }
    Mat src, res;
    vector<Mat> spl;
    for(;;) //Show the image captured in the window and repeat
    {
        inputVideo >> src;              // read
        if (src.empty()) break;         // check if at end
        split(src, spl);                // process - extract only the correct channel
        for (int i =0; i < 3; ++i)
            if (i != channel)
                spl[i] = Mat::zeros(S, spl[0].type());
       merge(spl, res);
       //outputVideo.write(res); //save or
       outputVideo << res;
    }
    cout << "Finished writing" << endl;
    return 0;
}

//#######################################################################