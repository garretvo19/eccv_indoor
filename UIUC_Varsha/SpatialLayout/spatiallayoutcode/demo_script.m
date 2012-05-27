clear;
% Add local code directories to Matlab path
addpaths;

dataset = 'UIUC_CVPR';
%% prep directories
orgdir = '../../../UIUC_CVPR_dataset/Images/'; % ['../../../Data_Collection/' dataset '/'];
imdir = ['../../../Results/temp/' dataset '/resized/'];
if ~exist(imdir,'dir')
    mkdir(imdir);
end
workspcdir=['../../../Results/temp/' dataset '/layout/']; % '../tempworkspace/'; % directory to save intermediate results
if ~exist(workspcdir,'dir')
    mkdir(workspcdir);
end
resdir = ['../../../Results/layout/' dataset '/']; % '../tempworkspace/'; % directory to save intermediate results
if ~exist(resdir,'dir')
    mkdir(resdir);
end
%% extensions
exts = {'jpg'};
%% image resize all
for e = 1:length(exts)
    files = dir(fullfile(orgdir, ['*.' exts{e}]));
    for i = 1:length(files)
        idx = find(files(i).name == '.', 1, 'last');
        destfile = fullfile(imdir, [files(i).name(1:idx-1) '.jpg']);
        
        if(exist(destfile, 'file'))
            continue;
        end
        
        img = imread(fullfile(orgdir, files(i).name));
        if(size(img, 2) > 640)
            resizefactor = 640 / size(img, 2);
            img = imresize(img, resizefactor);
        end
        imwrite(img, destfile, 'JPEG');
    end
end
%% process all images!
try
    matlabpool open 8
catch ee
    ee
end

for e = 1:length(exts)
    files = dir(fullfile(imdir, ['*.' exts{e}]));

    fcnt = length(files);
    boxlayout = cell(fcnt, 1);
    surface_labels = cell(fcnt, 1);
    resizefactor = cell(fcnt, 1);
    fnames = cell(fcnt, 1);

    parfor i = 1:length(files)
		try
			[ boxlayout{i}, surface_labels{i}, resizefactor{i}, vpdata{i}] = getspatiallayout(imdir, files(i).name, workspcdir, 0);
			fnames{i} = fullfile(imdir, files(i).name);
		catch ee
		end
    end
    save(fullfile(resdir, ['res_set_' exts{e} '.mat']), 'boxlayout', 'surface_labels', 'resizefactor', 'vpdata', 'fnames');
end
matlabpool close
