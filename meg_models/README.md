This folder contains a model to decode Magnetoencephalography (MEG) data and is coded in Matlab.
The model uses an external library called CoSMoMVPA which starts the Machine Learning (SVM) process.  
This libraries and its dependencies should be installed locally first (see instructions below) before the model can be run as a Jupyter Notebook with papermill.


## Installation

###Prerequisites
These instructions are written with a Windows operating system in mind. Instructions for Mac OS or Linux are slightly different.

### Matlab
If you have not installed Matlab, do so first. 

CoSMoMVPA is depending on the SVM implementation of Matlab (R2017b or older; part of the Statistics / ML package).
The SVM implementation of Matlab R2019a is not compatible with the CoSMo library anymore, so this requires an external library called ‘libsvm'
The older versions of Matlab are not compatible with the latest version of Python. 

Summarizing:
* When using Matlab R2019a, you need to install libsvm
* When using Matlab R2017b or older, you need Python 3.6 or older


The next step is to install the [Matlab Engine API](https://nl.mathworks.com/help/matlab/matlab-engine-for-python.html) for Python. 
The instructions listed below are based on [this guide](https://nl.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html).

1. Locate the Matlab folder. You can do so by starting MATLAB and typing ```matlabroot``` in the command window. Alternatively, you can browse your "Program Files" folder for a folder called "MATLAB", and navigate to the subfolder of the most recent installed version (e.g. "R2017a"). The matlabroot path is generally something like: "C:\Program Files\MATLAB\R2017a".
2. Open a command window and enter the following commands:
```
cd "<matlabroot>\extern\engines\python"
python setup.py install
```

Note: Matlab Engine for Python does not support all Python versions. If the setup.py file can be run without problems, your default version is supported. Otherwise, you have to switch python versions.

### Install the Matlab kernel for Jupyter
We will be using [this Matlab kernel](https://github.com/Calysto/matlab_kernel). The instructions listed below are based on [this guide](https://github.com/Calysto/matlab_kernel/blob/master/README.rst).

1. Install the matlab_kernel package: ```pip3 install matlab_kernel```
2. Test the installation by running: ```jupyter notebook``` and selecting "Matlab" from the "New" menu in the notebook interface.

## Usage
You can run the model from the commandline with a custom set of parameters using papermill.
You may either set the values for parameters one by one using ```-p``` or ```--parameters```
```
papermill model.jasper -p [parameter1 value1] -p [parameter2 value2]
```
Using ```-f``` or ```--parameters_file``` you may provide a YAML file from which parameter values can be read
```
papermill model.jasper -f parameters.yaml

```
See also the instructions in the [papermill repository](https://github.com/nteract/papermill) 