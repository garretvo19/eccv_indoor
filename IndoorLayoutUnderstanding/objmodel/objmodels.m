function model = objmodels()

model = struct('name', cell(1, 0), 'type', cell(1, 0), ...
                'width', cell(1, 0), 'height', cell(1, 0), 'depth', cell(1, 0), ...
                'grounded', cell(1, 0), 'ori_sensitive', cell(1, 0));

idx = 1;
model(idx).name = 'Sofa';
model(idx).type = {'Wide' 'Narrow'};
model(idx).width = [1.8 .9];
model(idx).height = [0.8 0.8];
model(idx).depth = [0.8 0.8];
model(idx).grounded = 1;
model(idx).ori_sensitive = 1;

idx = idx + 1;
model(idx).name = 'Table';
model(idx).type = {'Wide' 'Square'};
model(idx).width = [1.2 0.8];
model(idx).height = [0.4 0.4];
model(idx).depth = [0.75 0.8];
model(idx).grounded = 1;
model(idx).ori_sensitive = 0;
% 
% model(3).name = 'TV';
% model(3).type = {'Flat' 'CRT'};
% model(3).width = [0.8, 0.5];
% model(3).height = [0.4, 0.5];
% model(3).depth = [0.2, 0.3];
% model(3).grounded = 0;

idx = idx + 1;
model(idx).name = 'Chair';
model(idx).type = {'Regular'};
model(idx).width = [0.5];
model(idx).height = [1.0];
model(idx).depth = [0.5];
model(idx).grounded = 1;
model(idx).ori_sensitive = 1;

idx = idx + 1;
model(idx).name = 'Bed';
model(idx).type = {'Full', 'Queen', 'King'};
model(idx).width = [1.5, 1.6, 2.1];
model(idx).height = [1.3, 1.3, 1.3];
model(idx).depth = [2.0, 2.1, 2.2];
model(idx).grounded = 1;
model(idx).ori_sensitive = 1;

idx = idx + 1;
model(idx).name = 'Dining Table';
model(idx).type = {'Wide' 'Square'};
model(idx).width = [1.2 0.8];
model(idx).height = [0.75 0.75];
model(idx).depth = [0.75 0.8];
model(idx).grounded = 1;
model(idx).ori_sensitive = 0;

end
