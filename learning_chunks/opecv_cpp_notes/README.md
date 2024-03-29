# opencv notes:

<details>
<summary style="font-size:2.35vw"> cv::Mat : background, slicing, display : </summary>
reference : <a href="https://docs.opencv.org/4.x/d6/d6d/tutorial_mat_the_basic_image_container.html">cv::Mat tutorial docs</a> 

reference : <a href="https://docs.opencv.org/2.4/modules/core/doc/basic_structures.html#vec">cv::Mat tutorial docs (older)</a> 


1. Mat is the object used for storing images as arrays.

2. cv::MAT object consists of a header containing matrix details like matrix dimention details, storing method, pixel value array address.

3. using the copy constructor () / list intialization {} / assigment = will only copy header. i.e. in the below code, all 3 objects A, B, C point to the same pixel matrix. 

```cpp
Mat A, C;
A = imread(argv[1], IMREAD_COLOR); 
Mat B(A); 
C = A;
```

4. to make a copy of the pixel value matrix , shoude use <code> cv::Mat::clone() </code> <code> cv::Mat::copyTo() </code>

```cpp
Mat F = A.clone();
Mat G;
A.copyTo(G);
```

5. i) indexing a matrix, Vec3b is to read a 3channel point vector
```cpp
//  OUTPUT 1
int r = 140, c = 140, ch = 0; 
cout <<"\n\nOUTPUT 1\n\n";
for(; r < 145; r++)
{
    cout << "[";
    for(; c < 145; c++)
    {
        cout<<frame.at<Vec3b>(r,c) << ", ";
    }
    c = 140;
    cout << "],\n";
}

//  OUTPUT 2
cout <<"\n\nOUTPUT 2\n";
Mat vizslice(frame(Range(140,145) , Range(140,145)));
cout << "\nmatrix chunk : \n" << format(vizslice, Formatter::FMT_NUMPY ) <<"\n"; 
```
![Alt text](./images/image-20.png)

indexing element by element : 
```cpp
Mat procChannels[3];
split(frame, procChannels);
//r = row index, c = col index, ch = channel
static_cast<int>(procChannels[ch].at<uchar>(r,c))
```


5. ii) to **slice** Mat

```cpp
Mat frame;
*inputVideo >> frame;
Mat slice{frame(Range(140,145) , Range(140,145))};
```
![Alt text](./images/image.png)
(c*ch) * r ?


6. Mat with random values <code>cv::randu()</code>

```cpp
Mat R = Mat(3, 2, CV_8UC3);
randu(R, Scalar::all(0), Scalar::all(255));
```

7. <details><summary> Assignment of rows/columns and slices : 

<a href="https://docs.opencv.org/2.4/modules/core/doc/basic_structures.html#vec">extensive Mat tutorial </a>

rows/ cols: 

```cpp
// add the 5-th row, multiplied by 3 to the 3rd row
M.row(3) = M.row(3) + M.row(5)*3;

// now copy the 7-th column to the 1-st column
// M.col(1) = M.col(7); // this will not work
Mat M1 = M.col(1);
M.col(7).copyTo(M1);
```
slices:
```cpp
// create a new 320x240 image
Mat img(Size(320,240),CV_8UC3);
// select a ROI
Mat roi(img, Rect(10,10,100,100));
// fill the ROI with (0,255,0) (which is green in RGB space);
// the original 320x240 image will be modified
roi = Scalar(0,255,0);
```



8. formatting Mat dislay in cout :  <code>format(mat_name, Formatter::FMT_PYTHON)</code>

```cpp
Mat slice{frame(Range(140,145) , Range(140,145))};
cout << "\nmatrix chunk : \n" << format(slice Formatter::FMT_NUMPY ) <<"\n";
```
![Alt text](./images/image-1.png)

9. A Mapping of Type to Numbers in OpenCV
reference : <a href="https://gist.github.com/yangcha/38f2fa630e223a8546f9b48ebbb3e61a">Mat types</a>

| | C1 | C2 | C3 | C4
|---|---|---|---|---|
|CV_8U|	0|	8|	16|	24
|CV_8S|	1|	9|	17|	25
|CV_16U| 2|	10|	18|	26
|CV_16S| 3|	11|	19|	27
|CV_32S| 4|	12|	20|	28
|CV_32F| 5|	13|	21|	29
|CV_64F| 6|	14|	22|	30

10. \* operator does matrix multiplication not element wise.

11. <code> interim.convertTo(interim, CV_64F); </code> convert mats before processing and operating on them, or else crazy things happen 
<br>
</details>


<details>
<summary style="font-size:2.35vw"> color spaces and applications : </summary>

reference : <a href="https://docs.opencv.org/4.x/d6/d6d/tutorial_mat_the_basic_image_container.html">cv::Mat tutorial docs</a> 

- ***RGB*** is the most common as our eyes use something similar, however keep in mind that OpenCV standard display system composes colors using the BGR color space (red and blue channels are swapped places).
- The ***HSV*** and ***HLS*** decompose colors into their hue, saturation and value/luminance components, which is a more natural way for us to describe colors. You might, for example, dismiss the last component, making your algorithm less sensible to the light conditions of the input image.
- ***YCrCb*** is used by the popular JPEG image format.
- ***CIE L\*a\*b\**** is a perceptually uniform color space, which comes in handy if you need to measure the distance of a given color to another color.

</details>

<details><summary>LATEST WORKING http streaming of webcam output for opencv live video inference </summary>

- Go to the installation and setup repository, and find the coressponding folder.
- create conda env, configure what ever is needed by that subfolder.
- run main.py
- copy past <code> http://10.110.115.50:5000/ </code> in the browser or whatever looks like that from the output of main.py
- when the page opens, click open image in new tab.
- <code> http://10.110.115.50:5000/video_feed </code> the url for the feed should look something like this. use this as source for your 

```cpp
VID = "http://10.110.115.50:5000/video_feed"
cv::VideoCapture inputvideo(VID);
Mat frame;
*inputvideo >> frame
```
</details>
<details>
<summary style="font-size:2.35vw">NOT WORKING ANYMORE setting up IP CAM from integrated web-cam : to use webcam with opencv c++ in a docker image hosted on WSL</summary>
reference : <a href="https://www.youtube.com/watch?v=zd012EHvsIg">ip cam using VLC media player</a>

1. open vlc media player
2. goto media -> stream
3. goto capture device tab and select video device name, and audio device name.
4. click "advanced options" button in the same step and "tick" the device properties checkbox
5. click on the scroll down attached to the "stream" button, and click "stream"

![Alt text](./images/image-2.png)
6. at the source setting window, click next.
7. open the file scroll down and click **http** (change 1), 
8. click add, and type in the some name (referred to as \<some name\> from now on.), this will be part of the url.

 ![Alt text](./images/image-3.png)

9. select "video - H.264 + MP3 (MP4)" 

![Alt text](./images/image-5.png)

10. select **MP4/MOV** change(2)

![Alt text](./images/image-6.png)

11. click the "spanner" icon next to the previously set dropdown, go to each of the tabs in the configuration window, and apply settings as below : 

![Alt text](./images/image-7.png)

![Alt text](./images/image-8.png)

nothing needed for subtitles , because we dont have any

12. click save, and next

13. from the generated output string, copy the highlighted part. This part will be part of the stream's URL

![Alt text](./images/image-9.png)

14. click stream

15. a new window wil openup with video properties, click default, in both "Video Proc Amp" tab, and "Camera Control" tab.

![Alt text](./images/image-10.png)

16. click next / apply + ok

![Alt text](./images/image-11.png)

17. click apply + OK

17. the audio properties tab will open, click apply + OK in this tab as well.

![Alt text](./images/image-12.png)

18. check the vlc media player's window. the stream should have started :

![Alt text](./images/image-13.png)


19. find your ip address using the "ipconfig /all" command in cmd

20. search for this part of the output, and look under **IPv4 Address** for your IP address, which will be in the following format : xx.xxx.xxx.xx

![Alt text](./images/image-15.png)

21. your final ip camera url will be "http://\<ip address\>:8080/\<some name\>", (reffer previous steps for what \<some name\> is.)

22. Now you can do add use the below lines of code and have a valid object that returns frames from the ip camera, in your docker container.

```cpp
string vidPath = "http://<ip address>:8080/<some name>";
inputVideo = new VideoCapture(vidPath);
```
</details>

<details>
<summary style="font-size:2.35vw"> difference between a = &b, and *a = b, (using cv::mat)</summary>
reference : <a href="https://stackoverflow.com/a/13017187">discusssion forum</a>

```cpp
    Mat a = Mat(1,3,CV_8U, Scalar(1));
    Mat b = Mat(1,5,CV_8U, Scalar(0));
    Mat* aptr = &a;
    Mat* bptr = &b;
```

<code>aptr = &b;</code>
a's value is now the address if b. therefore:
- bptr should be = aptr
- aptr should now be pointing to b
- *bptr will point to b
- so both aptr, and btr points to b,
- a remains untouched.

![Alt text](./images/image-18.png)

<code>*aptr = b;</code>
- a should be overwritten by b, because initially *aptr = a
- aptr AKA late a's address, should now point to a copy of b.
-  bptr wasnt touched, so bptr will remain pointing to the original b .

![Alt text](./images/image-17.png)

</details>

<details>
<summary style="font-size:2.35vw">Understanding passing by address.</summary>

- when passed as address, although the addresses of actual parameters are copied to formal parameters, if the the formal parameter's values (these are pointers) are reassigned to point to a different address, the change WONT reflect in the actual parameters. DONT COUNT ON IT AGAIN.

- Also, DONT hesitate to pass <code>cv::Mat</code> by value, by doing so you are NOT passing the pixel value array, but just a class object that contains some details about the array, and the pointer to it, as mentioned above. Moreover, the size of mat is about the same for any Mat intance. For instance:

```cpp
*inputVideo >> frame;
Mat gblurr = Mat(5, 5, CV_32F, data);
cout << "\n\nfilter : dimentions : " << gblurr.size() << " object size : "<< sizeof(gblurr);
cout << "\nframe : dimentions : "<< frame.size() << " object size : " << sizeof(frame) << "\n\n"; 
```
![Alt text](./images/image-19.png)
</details>

<details><summary> Confusion between shape representation and definition, which are rows and which are columns? </summary>

The Definition of a Mat <code>Mat testmat = Mat(1, 5, CV_32FC1, Scalar(2));</code> is done as (rows, columns, type, value), but the <code>Mat.size()</code> function returns dims as [columns x rows], which causes a lot of confusion. check how the shape of the matrices look when they are multiplied, in the below image. 

```cpp
gblurr1dCh = Mat(1, 5, CV_32FC1, Scalar(2));
colSlice = Mat(640, 5, CV_32FC1, Scalar(3));

cout << "\n\n\nvisualizing shape in order of multiplication : "<< gblurr1dCh.size() <<" * "<<colSlice.t().size()<<"\n\n\n";

Mat prodtest =  gblurr1dCh * colSlice.t(); 

cout << format(prodtest, Formatter::FMT_NUMPY);
```

![Alt text](./images/image-21.png)

</details>

<details><summary> N-D Mats, initialization and assignment </summary>

<a href="https://docs.opencv.org/4.x/d3/d63/classcv_1_1Mat.html#aa90cea495029c7d1ee0a41361ccecdf3">accessing nd arrays using pointers as a long 1d array;</a>

<a href="https://forum.opencv.org/t/slicing-operation-help/13355/7"> Reference resource link </a>

relevant classes and functions : 
- <a href="https://docs.opencv.org/4.x/d3/d63/classcv_1_1Mat.html#ad543b6bd296ae1247032c750af4718e1">operator()()</a>

- <a href="https://docs.opencv.org/4.x/d3/d63/classcv_1_1Mat.html#a40b5b3371a9c2a4b2b8ce0c8068d7c96">locateROI()</a>

code sample : 

```cpp
const int sz[] = {3,8,8,5}; // slightly smaller for viz.
cv::Mat input_array(4,sz,CV_32F,cv::Scalar(1.0));
std::vector<cv::Range> ranges;
  ranges.push_back(cv::Range::all());
  ranges.push_back(cv::Range::all());
  ranges.push_back(cv::Range::all());
  ranges.push_back(cv::Range(0, 2));

cv::Mat subarray = input_array(ranges);
cout << subarray.size << endl;
subarray = subarray * 2; // some op
cout << Mat(8,8,CV_32F,input_array.ptr(0));
```




![Alt text](./images/image-22.png)


```cpp
cv::Mat largeMat = cv::Mat::zeros(500, 500, CV_8UC3);

cv::Mat smallMat = cv::Mat::zeros(100, 100, CV_8UC3);

smallMat.setTo(cv::Scalar(255, 0, 0)); // Blue 

cv::Rect roi(200, 200, smallMat.cols, smallMat.rows);

smallMat.copyTo(largeMat(roi));
```

![Alt text](./images/image-23.png)

</details>
<br>

- cv::sum() returns the sum channel by channel, 0 if the channel is not present, (4 channels no matter what?)

<br>

-  when using cv::Mat as values for std::map, all the values are getting overwritten. dosent happen with vectors, or integers

<br>

<details>
<summary>
row/ column assignment
</summary>

```cpp
cv::Mat a(cv::Size(10, 10), CV_64FC1, cv::Scalar(1));
cv::Mar ac(cv::Size(10, 1), CV_64FC1, cv::Scalar(5));
cv::Mat ar(cv::Size(1, 10), CV_64FC1, cv::Scalar(7));

ac.copyTo(a.col(0));
ar.copyTo(a.row(2));

printmat(a, INT_MAX);

```

![alt text](./images/image-24.png)

</details>
