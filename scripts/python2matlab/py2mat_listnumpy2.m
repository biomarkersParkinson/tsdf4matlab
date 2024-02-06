function matlab_arrays = py2mat_listnumpy2(py_arrays)
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
    for i = 1:length(py_arrays)
        % Convert the NumPy array to a MATLAB array
        dims = cell(py_arrays{i}.shape);
        matlab_arrays{i} = reshape(double(py.numpy.array(py_arrays{i})), dims{1}, []);   % already in the correct shape but reshaping is necessary to go from a row vector to a column vector for the quality and time values
    end
end
