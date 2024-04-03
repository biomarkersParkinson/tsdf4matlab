function [py_arrays] = mat2py_listnumpy(matlab_arrays)
    % Convert a list of MATLAB arrays to a list of NumPy arrays (Python variables).
    %
    % Args:
    %   matlab_arrays: A list of MATLAB arrays.
    %
    % Returns:
    %   py_arrays: A list of NumPy arrays.

   % Initialize a Python list for py_arrays
   py_arrays = py.list();

   % Convert MATLAB arrays to NumPy arrays
   for i = 1:numel(matlab_arrays)
       if isrow(matlab_arrays{i})
            np_array = py.numpy.array({matlab_arrays{i}});
       else
            np_array = py.numpy.array(matlab_arrays{i});  
       end
       py_arrays.append(np_array);
   end
end
