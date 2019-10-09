function out=sdk9to3(in)
out=zeros(3,3,3,3,10);
for i1=1:3
    for i2=1:3
        for j1=1:3
            for j2=1:3
                i=3*(i1-1)+i2;
                j=3*(j1-1)+j2;
                k=in(i,j);
%                 out(i1,i2,j1,j2,10)=k;
                if in(i,j)==0
                    out(i1,i2,j1,j2,1:9)=1;
                else
                    out(i1,i2,j1,j2,k)=1;
                end
            end
        end
    end
end
