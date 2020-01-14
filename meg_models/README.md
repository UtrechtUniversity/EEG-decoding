# MEG-decoding
This folder contains a model to decode Magnetoencephalography (MEG) data and is coded in Matlab.
The model uses an external library called CoSMoMVPA which starts the Machine Learning (SVM) process.  
This libraries and its dependencies should be installed locally first (see instructions below) before the model can be run as a Jupyter Notebook with papermill.


## Installation

### Prerequisites
These instructions are written with a Windows operating system in mind. Instructions for Mac OS or Linux are slightly different.

### Git
You need to have Git installed if you would like to run the model from the
command line with papermill and our papermill-extension. Windows users can
[download Git here](https://git-scm.com/download/win), Mac users
[can use Homebrew](https://git-scm.com/book/en/v1/Getting-Started-Installing-Git#Installing-on-Mac).

### Matlab
If you have not installed Matlab, please do so.

The model uses the CoSMoMVPA library. CoSMoMVPA is depending on the SVM
implementation of Matlab (R2017b or older; part of the Statistics / ML package).
The SVM implementation of Matlab R2019a is not compatible with the CoSMoMVPA
library anymore, so this requires an external library called ‘libsvm'
The older versions of Matlab are not compatible with the latest version of Python.

Summarizing:
* When using Matlab R2019a, you need to install libsvm
* When using Matlab R2017b or older, you need Python 3.6

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

1. Install the matlab_kernel package: ```pip install matlab_kernel```
2. Test the installation by running: ```jupyter notebook``` and selecting "Matlab" from the "New" menu in the notebook interface.

### FieldTrip
[Download the latest Fieldtrip toolbox](http://www.fieldtriptoolbox.org/download.php) into
a convenient folder on your local harddrive. Note: the toolbox comes in a zip-file.
After extracting you might end up with a folder _containing_ the toolbox folder.
Move the toolbox folder out of the wrapping folder when this happens.

### CoSMoMVPA
The second required library is CoSMoMVPA. Download instructions
[can found here](http://www.cosmomvpa.org/download.html).

Note: the model needs both paths towards these libraries. If you download
this repo, you have to add these paths in the notebooks before running them.
If you want to run this model with papermill, the paths are expected as
parameters.

### Install papermill plus extension
To run notebooks from the command line you also need papermill.
If you would like to run notebooks from github repositories, install papermill together with the extension
```
pip install git+https://github.com/UtrechtUniversity/EEG-decoding-software.git
```

## Usage
When you have downloaded this repo you can start a Jupyter session to
run the model. Make sure you add the paths towards the FieldTrip toolbox and
the CoSMoMVPA library. Parameters can be changed within the notebook.

If you run the model from the command line your best course of action is to
provide a YAML file containing model parameters and the mentioned paths. An
example of such a YAML file can be found in the repo (parameters_example.yaml)

```
papermill model.jasper.json [path_to_out_file] -f parameters.yaml
```
