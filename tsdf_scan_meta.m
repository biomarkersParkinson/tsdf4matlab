function tsdb = tsdf_scan_meta(tsdb_data_path, tsdb_dirlist)

% For each given TSDB directory, transcribe TSDB metadata contents to SQL table
tsdb = [];
irow = 1;
for i = 1:length(tsdb_dirlist)

    meta_list = dir(fullfile(tsdb_data_path, tsdb_dirlist{i}, "*_meta.json"));
    meta_filenames = {meta_list.name};

    jsonobj = {};
    for n = 1:length(meta_filenames)
        tsdb_meta_fullpath = fullfile(tsdb_data_path, tsdb_dirlist{i}, meta_filenames{n});
        jsonstr = fileread(tsdb_meta_fullpath);
        jsonobj{n} = loadjson(jsonstr);
        ppp_strs = regexp(jsonobj{n}.ppp_source_protobuf, '\.', 'split');
        tsdb(irow).tsdb_meta_fullpath = tsdb_meta_fullpath;
        tsdb(irow).subject_id = jsonobj{n}.subject_id;
        tsdb(irow).sensor_type = ppp_strs{2};
        tsdb(irow).week_num = str2num(ppp_strs{3}(5:end));
        %tsdb(irow).start_datetime_unix_ms = jsonobj{n}.start_datetime_unix_ms;
        tsdb(irow).start_iso8601 = jsonobj{n}.start_iso8601;
        %tsdb(irow).end_datetime_unix_ms = jsonobj{n}.end_datetime_unix_ms;
        tsdb(irow).end_iso8601 = jsonobj{n}.end_iso8601;
        irow = irow + 1;
    end

end
