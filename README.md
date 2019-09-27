# EEG-decoding
This repository describes a flexible workflow for running and storing parameterized models that are coded in [Jupyter Notebooks](https://jupyter.readthedocs.io/en/latest/install.html) 

You may choose to run a model in the Jupyter Notebook interface in your browser to inspect the code and run it interactively.

Alternatively, you may choose to run a model from the command line with a customized set of parameters using [papermill](https://github.com/nteract/papermill).
The output and the parametrized notebook are saved together as workflow. 
The notebooks may be retrieved from a local or remote folder.
We build an [extension](https://github.com/UtrechtUniversity/EEG-decoding-software) to the papermill main package to run remote notebooks from github repositories.



## Prerequisites
If you would like to run a model in the Jupyter Notebook interface, you need to have Jupyter installed.
If you would like to run to run a model from the commandline you also need papermill.
See below for the installation instructions. 
This instructions are written with a Windows operating system in mind; instructions for Mac OS or Linux are slightly different.

## Installation

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


### Install papermill
To run notebooks from the commandline you also need papermill.
If you would like to run notebooks from github repositories, install papermill together with the extension 
```
pip install git+https://github.com/UtrechtUniversity/EEG-decoding-software.git
```

## Usage
You can run a model from the commandline with a custom set of parameters using papermill.
For the [example notebook] (python_example/Demo_calc_BMI.ipynb) in this repository, the command looks like this
```
papermill https://github.com/UtrechtUniversity/EEG-decoding/blob/master/python_example/Demo_calc_BMI.ipynb [path_to_out_dir] -p weight 108 -p length 1.54
```
You may either set the values for parameters one by one using ```-p``` or ```--parameters```or you may provide a YAML file from which parameter values can be read using ```-f``` or ```--parameters_file``` 
```
papermill [path_to_model] [path_to_out_dir] -f parameters.yaml

```
For more options running notebooks from the commandline, see the instructions in the [papermill repository](https://github.com/nteract/papermill) 
