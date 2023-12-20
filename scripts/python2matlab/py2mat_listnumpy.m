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
    for i = 1:length(py_arrays)
        % Convert the NumPy array to a MATLAB array
        matlab_arrays{i} = double(py.array.array('d', py.numpy.nditer(py_arrays{i})));
        % Reshape the array if necessary
        dims = cell(py_arrays{i}.shape);
        if numel(dims) > 1
            matlab_arrays{i} = reshape(matlab_arrays{i}, dims{2}, dims{1})';            % Issue in reshaping the IMU --> now fixed --> how can we do it best practice
        elseif numel(dims) == 1
            matlab_arrays{i} = reshape(matlab_arrays{i}, [], 1);
        end
    end
end
