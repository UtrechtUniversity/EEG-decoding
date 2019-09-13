# EEG-decoding

## Prerequisites
This guide is written with a Windows operating system in mind. Instructions for Mac OS or Linux are slightly different.
### Jupyter
If you have not installed [Jupyter](https://jupyter.readthedocs.io/en/latest/install.html), do so first:
```
pip install jupyter
```
You can check your installation of Python and Jupyter by running (Windows command prompt):
```
where python
where jupyter
```

It is useful to change the default location that is opened in the Jupyter Notebook interface. To achieve this, first create a jupyter config file:
```
jupyter notebook --generate-config
```
The prompt will respond with a message like: "Writing default config to: <path>". Open the default config file, and look for the ```c.NotebookApp.notebook_dir``` option. Remove the '#' in front and set the option to the directory where you store your notebooks. Make sure to replace single directory seperators '\\' with dubble '\\\\', e.g. "C:\\\\Users\\\\User\\\\Documents\\\\Notebooks".

### Matlab
If you have not installed Matlab, do so first. Any version above 2016b should work.

The next step is to install the [Matlab Engine API](https://nl.mathworks.com/help/matlab/matlab-engine-for-python.html) for Python. The instructions listed below are based on [this guide](https://nl.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html).

1. Locate the Matlab folder. You can do so by starting MATLAB and typing ```matlabroot``` in the command window. Alternatively, you can browse your "Program Files" folder for a folder called "MATLAB", and navigate to the subfolder of the most recent installed version (e.g. "R2017a"). The matlabroot path is generally something like: "C:\Program Files\MATLAB\R2017a".
2. Open a command window and enter the following commands:
```
cd "<matlabroot>\extern\engines\python"
python setup.py install
```

Note: Matlab Engine for Python does not support all Python versions. If the setup.py file can be run without problems, your default version is supported. Otherwise, you have to switch python versions.

## Install the Matlab kernel for Jupyter
We will be using [this Matlab kernel](https://github.com/Calysto/matlab_kernel). The instructions listed below are based on [this guide](https://github.com/Calysto/matlab_kernel/blob/master/README.rst).

1. Install the matlab_kernel package: ```pip3 install matlab_kernel```
2. Test the installation by running: ```jupyter notebook``` and selecting "Matlab" from the "New" menu in the notebook interface.

## Install papermill 
Papermill can be used to parameterize notebooks.
Currently, the [main package](https://github.com/nteract/papermill) has no Matlab support, so for now, install [this fork](https://github.com/RoelBrouwer/papermill):

```
pip install git+https://github.com/RoelBrouwer/papermill.git@matlab-translation
```
or
```
pip install https://github.com/RoelBrouwer/papermill/archive/matlab-translation.zip
```

For documentation and usage [refer to the main repository](https://github.com/nteract/papermill#usage).

## Notes from Casper:

* libsvm: git clone https://github.com/cjlin1/libsvm.git -- in Matlab open downloaded folder and in console type 'make' (this is form unix-like systems) and the path towards the matlab folder needs to be added


