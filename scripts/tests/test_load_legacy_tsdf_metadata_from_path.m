function tests = test_load_legacy_tsdf_metadata_from_path
    tests = functiontests(localfunctions);
end

function test_successful_load(testCase)
    % Test that the function can load the legacy metadata and binary files
    
    % Arrange
    input_path = '..\..\data\ppp_format_meta_legacy.json';
    
    % Act
    [mat_list_metadata, mat_list_data] = load_legacy_tsdf_metadata_from_path(input_path);
    
    % Assert
    assert(length(mat_list_metadata) == 2, 'Number of identified metadata elements in not correct.');
    assert(length(mat_list_data) == 2, 'Number of identified binary files in not correct.');
end