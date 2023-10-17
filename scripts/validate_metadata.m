function is_good_format = verify_metadata_string(json_str)
   % Verify if a given JSON string is in proper TSDF Metadata format

   % INPUT:
   %   json_str: string containing the TSDF metadata in JSON format

   % OUTPUT:
   %   is_good_format: logical indicating if the format is good (true) or not (false)

   try
       % Convert the input to a python string
       py_json_str = py.str(json_str);

       % Run the python script and get the output
       is_good_format = pyrunfile('python/load_metadata_string.py', 'verify_metadata_format', py_json_str);
       
       % Convert Python boolean to MATLAB logical
       is_good_format = logical(is_good_format);
   catch
       % If there is an error (e.g., due to invalid JSON format), set is_good_format to false
       is_good_format = false;
   end
end
