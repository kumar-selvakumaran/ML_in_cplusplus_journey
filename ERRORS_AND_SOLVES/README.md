# ERRORS AND SOLVES

<details>
<summary>container not starting (no error message, returns to terminal)</summary>**SOLVE** : docker desktop is probably swithced off, switch it on
<br> 
</details>


<details><summary>error while loading shared libraries: libopencv_gapi.so.4.2: cannot open shared object file: No such file or directory.</summary>
**SOLVE** : although no indication, installing boost solves the problem (dependency issue): apt-get install -y scons libboost-all-dev  </details>

<details><summary>

![Alt text](./images/image.png)
  
  </summary>

 the huge assert  expression evaluates to : <code>( type == 5 || type == 6 || type == 13 || type == 14 ).</code>

 all the <code>&</code>s and <code>>></code>'s and are <a href="https://www.geeksforgeeks.org/bitwise-operators-in-c-cpp/"> bitwise operations.</a>

 reffering back to <a href="https://gist.github.com/yangcha/38f2fa630e223a8546f9b48ebbb3e61a"> cv::Mat types </a> , and mapping the values 5, 6, 13, 14, we can see the types which are supported for the operation that gave the error. : i.e.

 | | C1 | C2 | C3 | C4
|---|---|---|---|---|
|CV_8U|	0|	8|	16|	24
|CV_8S|	1|	9|	17|	25
|CV_16U| 2|	10|	18|	26
|CV_16S| 3|	11|	19|	27
|CV_32S| 4|	12|	20|	28
|CV_32F| 5|	13|	21|	29
|CV_64F| 6|	14|	22|	30

according to the table, the operations are supported only for 1 channel and 2 channel operations for Floats, since matrices are 3 channels, we cant do a lot of such operations for image matrices directly, We will have to do it channel wise.
