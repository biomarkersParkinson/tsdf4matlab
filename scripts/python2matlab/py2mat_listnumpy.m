function [matlab_arrays] = py2mat_listnumpy(py_arrays)
    % Convert a list of NumPy arrays (Python variables) to a list of MATLAB arrays.
    %
    % Args:
    %   py_arrays: A list of NumPy arrays.
    %
    % Returns:
    %   matlab_arrays: A list of MATLAB arrays.

    % Initialize MATLAB structures
    matlab_arrays = cell(size(py_arrays));
    
    % Convert NumPy arrays to MATLAB arrays
    for i = 1:numel(py_arrays)
        % Convert the NumPy array to a MATLAB array
        matlab_arrays{i} = double(py.array.array('d', py.numpy.nditer(py_arrays{i})));
        % Reshape the array if necessary
        dims = cell(py_arrays{i}.shape);
        if numel(dims) > 1
            matlab_arrays{i} = reshape(matlab_arrays{i}, dims{:});
        end
    end
end
