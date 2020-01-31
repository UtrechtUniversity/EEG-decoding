# EEG-decoding
This repository describes a flexible workflow for running and storing parameterized Jupyter Notebooks from github repositories

Our workflow is based on [papermill](https://github.com/nteract/papermill). This tool runs a notebook from the command line with a customized set of parameters and saves the parameterized notebook and outcomes together as output. We build [gitmiller](https://pypi.org/project/gitmiller/) which is an extension to the papermill main package to run remote notebooks from github repositories.



## Installation
### Jupyter
If you would like to inspect or run a notebook interactively in the Jupyter Notebook interface, you need to have [Jupyter](https://jupyter.readthedocs.io/en/latest/install.html) installed. The instructions below are written with a Windows operating system in mind; instructions for Mac OS or Linux are slightly different.
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
The prompt will respond with a message like: "Writing default config to: <path>". Open the default config file, and look for the ```c.NotebookApp.notebook_dir``` option. Remove the '#' in front and set the option to the directory where you store your notebooks. Make sure to replace single directory separators '\\' with double '\\\\', e.g. "C:\\\\Users\\\\User\\\\Documents\\\\Notebooks".


### Gitmiller
The [papermill](https://github.com/nteract/papermill) package allows you to parameterize notebooks and execute these from the commandline. If these notebooks live in remote github repositories, you need to install [GitMiller](https://pypi.org/project/gitmiller/). GitMiller downloads the repository in your temp folder, runs the designated notebook within it using papermill, and removes all downloaded files afterwards. 
```
pip install gitmiller
```

## Usage
The gitmiller commandline-interface requires several parameters which are described in [parameters.yaml](parameters.yaml).  If you would like to override certain variables in your notebook, add the variables and values in the yaml file under the papermill key. 

The [GitMiller repository](`https://github.com/UtrechtUniversity/GitMiller/tree/master/example) contains a folder with an **example notebook**. To run this example create the following yaml file

    repository: https://github.com/UtrechtUniversity/GitMiller/tree/master/example
    username: <GITHUB USERNAME>
    password: <GITHUB PASSWORD>
    notebook: test.ipynb
    output: <PATH-TO-OUTPUT-FOLDER>
    
    papermill:
      a: 10
      b: 60

Run the notebook with
```
gitmiller -c <PATH-TO-YAML-FILE>
```


