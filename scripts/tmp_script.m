% Define the paths and file names
clc
metadata_path = '..\data\ppp_format_meta_legacy.json';
output_dir = '..\data\test';
output_meta_name = 'output.json';

% Load metadata and data
[mat_list_metadata, mat_list_data] = load_legacy_tsdf_metadata_from_path(metadata_path);

% Create output directory if it doesn't exist
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

% Save metadata and data
mat_succ = save_tsdf_data(mat_list_metadata, mat_list_data, output_dir, output_meta_name);

% Display success message
% if mat_succ
%     disp('Data saved successfully.');
% else
%     disp('Error while saving data.');
% end
