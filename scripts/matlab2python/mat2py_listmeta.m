function [py_dicts] = mat2py_listmeta(matlab_dicts)
    % Convert a list of MATLAB structures to a list of Python dictionaries (Python variables).
    %
    % Args:
    %   matlab_dicts: A list of MATLAB structures.
    %
    % Returns:
    %   
    %   py_dicts: A list of Python dictionaries.

    % Initialize Python list for py_dicts
    py_dicts = py.list();

    % Convert MATLAB structures to Python dictionaries
    for i = 1:numel(matlab_dicts)
        py_dicts.append(jsonencode(matlab_dicts{i}));
    end
end
