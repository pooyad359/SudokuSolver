function [n1,n2]=single2(v)
v=reshape(v,3,3);

if sum(sum(v))>1
    n1=0;
    n2=0;
elseif sum(sum(v))==1
    for i=1:3
        for j=1:3
            if v(i,j)==1
                n1=i;
                n2=j;
                return
            end
        end
    end
else
    warning('No possibility found')
end