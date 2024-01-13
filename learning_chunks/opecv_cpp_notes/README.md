# opencv notes:

1. Mat is the object used for storing images as arrays.

2. to **slice** Mat

```cpp
Mat frame;
*inputVideo >> frame;
Mat slice{frame(Range(140,145) , Range(140,145))};
```
![Alt text](image.png)
