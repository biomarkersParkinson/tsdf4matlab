# Matlab wrapper for the Python [tsdf](https://github.com/biomarkersParkinson/tsdf) library

[![Latest release](https://img.shields.io/github/release/biomarkersparkinson/tsdf4matlab.svg)](https://github.com/biomarkersparkinson/tsdf4matlab/releases/latest)
[![DOI](https://zenodo.org/badge/693538057.svg)](https://zenodo.org/doi/10.5281/zenodo.10838512)
[![GitHub license](https://img.shields.io/github/license/biomarkersParkinson/tsdf4matlab)](https://github.com/biomarkersparkinson/tsdf4matlab/blob/main/LICENSE)

## Installation

In order to use the [tsdf](https://github.com/biomarkersParkinson/tsdf) library in Matlab, you need to install the `tsdf` library in Python and then link it to MatLab. The following steps will guide you through the installation process.

### Setting Up MATLAB-Python Integration

1. Ensure you have MATLAB version R2021b or higher.

2. Check your MATLAB version by running `ver` in MATLAB.

3. (optional) Visit [MATLAB's Python Support Page](https://nl.mathworks.com/support/requirements/python-compatibility.html) to verify compatible Python versions for your MATLAB version.

4. Download and install a Python version >= 3.9.

5. In MATLAB, execute the following code, replacing `'enter_path_to_python_executable_here'` with the path to your `python.exe` file:

   ```matlab
   pyenv('Version','enter_path_to_python_executable_here')
   ```
   For example:
   ```matlab
   pyenv('Version','C:\Users\username\AppData\Local\Programs\Python\Python39\python.exe')
   ```

6. Confirm the setup by running:

   ```matlab
   pe = pyenv;
   pe.Version
   ```

   You should receive confirmation messages indicating the Python version linked to MATLAB.

### Installing Required Libraries

1. If you had a previous Python version installed, ensure the required libraries are installed in your new Python 3.9 environment (linked to MATLAB).

2. Open the Windows command terminal and navigate to the Python 3.9 installation folder:

   ```bash
   cd C:\Users\username\AppData\Local\Programs\Python\Python39
   ```

3. Launch the Python terminal:

   ```bash
   python
   ```

4. Install necessary libraries (e.g., NumPy and SciPy) by entering:

   ```python
   import sys
   import subprocess
   subprocess.check_call([sys.executable, '-m', 'pip', 'install','tsdf'])
   ```

### Using the MATLAB Wrapper

1. Clone this repository to your local machine.

2. Open MATLAB and add the cloned folder to your MATLAB path.

```matlab
addpath('full_path_to_cloned_folder')
```

## Note

We aim to use this tutorial to integrate tsdf into the matlab code:

https://aleksandarhaber.com/tutorial-on-how-to-execute-python-code-directly-matlab/

The tutorial covers how to import numpy arrays from python code export them from Matlab double. A discussion on the topic is available here:

https://www.mathworks.com/matlabcentral/answers/157347-convert-python-numpy-array-to-double

Another article that is needed is on how to import python dict into Matlab and how to export them from Matlab struct.

https://nl.mathworks.com/help/matlab/matlab_external/python-dict-variables.html
