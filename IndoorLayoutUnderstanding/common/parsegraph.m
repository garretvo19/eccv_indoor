function pg = parsegraph(num)
if nargin == 0
    num = 1;
end
pg = struct('scenetype', cell(num, 1), 'layoutidx', cell(num, 1), 'camheight', cell(num, 1), ...
            'childs', cell(num, 1), 'lkhood', 0);
end