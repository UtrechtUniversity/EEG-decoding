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

# Time-resolved decoding

This script uses Multivariate Pattern Analysis (MVPA) to decode certain stimulus properties from MEG or EEG data over time. The input dataset (per subject) should be a FieldTrip structure with fully preprocessed and timelocked M/EEG data. The structure should contain trial specific condition information for each property that will be decoded (in the data.trialinfo field, see section 2.1). Decoding is run with the CoSMoMVPA toolbox, using one of two classifiers: linear discriminant analysis (LDA) or a support vector machine (SVM). The subsets of data used for training and testing the classifier are balanced over the properties as defined in the parameter balance. The output dataset (per subject) is a structure that contains the average performance and sensitivity of the decoder over time for each specified property. This dataset can be plotted in order to depict the classification performance over time. The dataset could also be used as an input for subsequent permutation (i.e. for statistics).

## 1. Input parameters
The document parameters.yaml contains all parameters that can be altered. It can be opened as a simple .txt file with a text editor. The following parameters can be edited:

| Parameter | Description |
| --- | --- |
| displaynow | _true_ or _false_ whether to display all subject names found in folderIN (used in _PSR\_subjects_ function). Can be useful to double check whether the script finds all the subjects you want to process. |
| nchar | number of characters in subjectfile (used in _PSR\_subjects_), e.g. for file named ‘subject01’, nchar = 9 |
| timeradius | number of neighboring time indices used to compute neighborhood intervals for temporal 'searchlight' (used in _cosmo\_interval\_neighborhood_) |
| nfolds | number of folds for cross-validation |
| ptest | proportion of data used as test-set to assess classifier accuracy (used in _PSR\_mkCoSMoPartitions\_BALANCE_), e.g. ptest = 0.1 |
| suffix | Nx2 cell-array: {‘prop1’, col1; ‘prop2’, col2; ‘_propN_’, _colN_} where ‘prop’ is a string defining the to-be classified stimulus property and col represents the column number in data.trialinfo, containing trial specific condition information of the corresponding property (see section 2.1 for more info). Example: suffix = { 'SF', 3; 'OR', 4}. Spatial frequency and orientation will be classified. The trial specific spatial frequency conditions can be found in column 3 and those of orientation can be found in column 4 of data.trialinfo.

N.B.: The correct use of commas, semicolons and quotation marks in the cell-array is important! Also, the string (propN) will be used as fieldname in the output dataset (i.e. S1.accuracy.(propN), see section 4.1), so give your property a sensible suffix. |
