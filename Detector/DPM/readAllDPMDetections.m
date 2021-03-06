function dets = readAllDPMDetections(imdir, resdir, exts)
dets = cell(1000, 1);

if ~exist(imdir, 'dir')
    return;
end
if ~exist(resdir, 'dir')
    return;
end

cnt = 1;
for i = 1:length(exts)
    files = dir(fullfile(imdir, ['*.' exts{i}]));
	for j = 1:length(files)
        idx = find(files(j).name == '.', 1, 'last');
		res = load(fullfile(resdir, files(j).name(1:idx-1)), 'top', 'dets', 'resizefactor');
        
        dets{cnt}.name = files(j).name;
        dets{cnt}.dets = res.dets;
        for k = 1:length(res.dets)
            dets{cnt}.tops{k} = nms(res.dets{k}, 0.5);
            dets{cnt}.tops2{k} = nms2(res.dets{k}, 0.5);
        end
        dets{cnt}.resizefactor = res.resizefactor;
        
        cnt = cnt + 1;
	end
end
dets(cnt:end) = [];

end