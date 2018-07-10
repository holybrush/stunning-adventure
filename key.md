# prepare
```
→ youtube-dl https://www.youtube.com/playlist?list=UUDDgDE-EMc-tSyp7xy4Pk9w
→ → mv Panopticam\ Daily\ Timelapse\ \(25-02-2016\)-f5V-cH-9udI.mp4 images/
→ → cd images/
→ → ffmpeg -i Panopticam\ Daily\ Timelapse\ \(25-02-2016\)-f5V-cH-9udI.mp4 thumb%04d.jpg -hide_banner
```
# prepare 2
[source](https://medium.com/@nuwanprabhath/installing-opencv-in-macos-high-sierra-for-python-3-89c79f0a246a)
```
→ sudo xcode-select --install
→ export PATH=/usr/local/bin:$PATH
→ exec bash
→ bash

→ brew install python python3
→ brew link python
→ conda update anaconda
→ brew postinstall python3
```

## virtualenv
```
→ pip3 install virtualenv virtualenvwrapper
→ PROJECT_HOME=$HOME/Develsource /usr/local/bin/virtualenvwrapper.sh
→ export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
→ export WORKON_HOME=$HOME/.virtualenvsexport
→ PROJECT_HOME=$HOME/Develsource /usr/local/bin/virtualenvwrapper.sh
```

## opencv
```
→ brew install opencv
→ echo /usr/local/opt/opencv/lib/python3.6/site-packages >> /usr/local/lib/python3.6/site-packages/opencv3.pth


→ mkvirtualenv cvpy3 -p python3
→ workon cvpy3
→ deactivate


→ pip install numpy scipy scikit-image matplotlib scikit-learn
→ cd ~/.virtualenvs/cvpy3/lib/python3.6/site-packages/
→ cd /Users/gyy4pc/.virtualenvsexport/cvpy3/lib/python3.6/site-packages
→ ln -s /usr/local/opt/opencv@3/lib/python3.6/site-packages/cv2.cpython-36m-darwin.so cv2.so

→ workon cvpy3
→ python3
>>> import cv2
>>> pip install numpy
>>> exit()
→ pip install numpy
→ pip3 install numpy
→ pip install -U numpy
→ import numpy as np
→ workon cvpy3

→ python3
>>> import numpy as np
>>> np.version
>>> import cv2
>>> print(cv2.__version__)
3.4.1
>>> deactivate
>>> exit()
→ deactivate
```

source `which virtualenvwrapper.sh`
mkvirtualenv cvpy3 -p python3
workon cvpy3
deactivate

# 7.5
[part1 - setup YOLO.ipynb](https://github.com/markjay4k/YOLO-series/blob/master/part1%20-%20setup%20YOLO.ipynb)

[darkflow](https://github.com/thtrieu/darkflow)

```
→ pip install numpy scipy scikit-image matplotlib scikit-learn
→ Requirement already satisfied: numpy in /usr/local/lib/python2.7/site-packages (1.14.5)
→ cd /Users/gyy4pc/.virtualenvsexport/cvpy3/lib/python3.6/site-packages
→ ln -s /usr/local/opt/opencv@3/lib/python3.6/site-packages/cv2.cpython-36m-darwin.so cv2.so

→ workon cvpy3
→ python3
>>> import cv2
>>> pip install numpy
>>> exit()

→ pip install numpy
→ pip install Cython
→ pip install -e .

→ python flow --model cfg/yolo.cfg --load bin/yolov2.weights --demo videofile.mp4  --saveVideo
→ git clone https://github.com/nwojke/deep_sort.git
→ curl -O https://owncloud.uni-koblenz.de/owncloud/s/f9JB0Jr7f3zzqs8/download
→ python -c“import keras; print（keras .__ version __）”
→ pip install keras

→ python /Users/gyy4pc/Desktop/try2/darkflow-master/deep_sort/deep_sort_app.py \

→ python3 setup.py build_ext --inplace
→ pip install .
→ flow --h
→ python run.py
```

# 7.6 casa
[Tracking-with-darkflow](https://github.com/bendidi/Tracking-with-darkflow)
```
(tf) C:\Users\student>cd /d D:\gyy\Tracking-with-darkflow-master\darkflow

(tf) D:\gyy\Tracking-with-darkflow-master\darkflow>pip install Cython
Requirement already satisfied: Cython in c:\users\student\anaconda3\envs\tf\lib\site-packages (0.28.3)

(tf) D:\gyy\Tracking-with-darkflow-master\darkflow> conda install cython

(tf) D:\gyy\Tracking-with-darkflow-master\darkflow>pip install statsmodels
Collecting statsmodels
  Downloading https://files.pythonhosted.org/packages/77/2b/8ba61399b31f984c263b177c2e2547a34f0d4d972a24a51fc77c376079b0/statsmodels-0.9.0-cp36-cp36m-win_amd64.whl (7.0MB)
    100% |████████████████████████████████| 7.0MB 6.6MB/s
Installing collected packages: statsmodels
Successfully installed statsmodels-0.9.0

(tf) D:\gyy\Tracking-with-darkflow-master\darkflow>python setup.py build_ext --inplace

(tf) D:\gyy\Tracking-with-darkflow-master\darkflow>pip install -e .

(tf) D:\gyy\Tracking-with-darkflow-master\darkflow>pip install .

(tf) D:\gyy\Tracking-with-darkflow-master\darkflow>python flow --h

(tf) D:\gyy\Tracking-with-darkflow-master\darkflow>cd /d D:\gyy\Tracking-with-darkflow-master\

(tf) D:\gyy\Tracking-with-darkflow-master>python run.py
```
