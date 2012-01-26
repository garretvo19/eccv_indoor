function verify_image(source_dir, dest_dir, ext)
images = dir(fullfile(source_dir, ['*.' ext]));
 
if ~exist(dest_dir, 'dir')
    mkdir(dest_dir);
end

for i = 1:length(images)
    imfile = fullfile(source_dir, images(i).name);
    dest = fullfile(dest_dir, images(i).name);
    
    if exist(dest, 'file')
        continue;
    end
    
    imshow(imfile);
    r = input('store image? (y/n)', 's');
    if(lower(r) == 'y')
        copyfile(imfile, dest);
    else
    end
end

end