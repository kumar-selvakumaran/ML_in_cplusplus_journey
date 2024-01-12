#ERRORS AND SOLVES

1. **ERROR(LEVEL 1)** : //container not starting (no error message, returns to terminal)
<br>**SOLVE** : docker desktop is probably swithced off, switch it on
<br> 


2. **ERROR (LEVEL 3)** : **error while loading shared libraries: libopencv_gapi.so.4.2:** cannot open shared object file: No such file or directory.
<br> **SOLVE** : although no indication, installing boost solves the problem (dependency issue): apt-get install -y scons libboost-all-dev  

