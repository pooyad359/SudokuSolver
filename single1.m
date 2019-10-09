function n=single1(v)
% identifies if just a single cell of the array is one and returns its
% place. if more than one cells are one will return zero. input must be in
% 3x3x3x3x10 format
if sum(v)>1
    n=0;
elseif sum(v)==1
    for i=1:9
        if v(i)==1
            n=i;
            return
        end
    end
else
    warning('No possibility found')
end
    