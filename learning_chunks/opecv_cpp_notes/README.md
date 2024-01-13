# opencv notes:

<details>
<summary style="font-size:2.35vw"> <b>cv::Mat : background, slicing, display : </b></summary>
reference : <a href="https://docs.opencv.org/4.x/d6/d6d/tutorial_mat_the_basic_image_container.html">cv::Mat tutorial docs</a> 

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


5. to **slice** Mat

```cpp
Mat frame;
*inputVideo >> frame;
Mat slice{frame(Range(140,145) , Range(140,145))};
```
![Alt text](image.png)
(c*ch) * r ?


6. Mat with random values <code>cv::randu()</code>

```cpp
Mat R = Mat(3, 2, CV_8UC3);
randu(R, Scalar::all(0), Scalar::all(255));
```

7. formatting Mat dislay in cout :  <code>format(mat_name, Formatter::FMT_PYTHON)</code>

```cpp
Mat slice{frame(Range(140,145) , Range(140,145))};
cout << "\nmatrix chunk : \n" << format(slice Formatter::FMT_NUMPY ) <<"\n";
```
![Alt text](image-1.png)
</details>


<details>
<summary style="font-size:2.35vw"> <b>color spaces and applications : </b></summary>

reference : <a href="https://docs.opencv.org/4.x/d6/d6d/tutorial_mat_the_basic_image_container.html">cv::Mat tutorial docs</a> 

- ***RGB*** is the most common as our eyes use something similar, however keep in mind that OpenCV standard display system composes colors using the BGR color space (red and blue channels are swapped places).
- The ***HSV*** and ***HLS*** decompose colors into their hue, saturation and value/luminance components, which is a more natural way for us to describe colors. You might, for example, dismiss the last component, making your algorithm less sensible to the light conditions of the input image.
- ***YCrCb*** is used by the popular JPEG image format.
- ***CIE L\*a\*b\**** is a perceptually uniform color space, which comes in handy if you need to measure the distance of a given color to another color.
<\details>
___


