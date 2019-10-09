function out=sngslv(in)
% simple solution method of sudoku by removing possibilities vertically,
% horizontaly and per macrocell.
out=in;
n=0;
while n<81
    n=n+1;
    j=floor((n-1)/9)+1;
    i=n-9*(j-1);
    i1=floor((i-1)/3)+1;
    i2=i-3*(i1-1);
    j1=floor((j-1)/3)+1;
    j2=j-3*(j1-1);
    if out(i1,i2,j1,j2,10)==0
        % only possibility in one cell
        v=out(i1,i2,j1,j2,1:9);
        nv=single1(v);
        if nv>0
            out(i1,i2,j1,j2,10)=nv;
            out(i1,i2,:,:,nv)=0;
            out(:,:,j1,j2,nv)=0;
            out(i1,:,j1,:,nv)=0;
            out(i1,i2,j1,j2,nv)=1;
            n=0;
        end
        % nowhere else 
        %**** it seems removing the following line makes the process
        %faster****
        %since it removes some time consuming pattern searches and goes
        %straight to trial and error
        %out=subslv(out);
    end
end
end

function out=subslv(in)
out=in;
for k=1:9
    % row
    for i=1:9
        i1=floor((i-1)/3)+1;
        i2=i-3*(i1-1);
        v=in(i1,i2,:,:,k);
        [j1,j2]=single2(v);
        
        if j1>0 && j2>0
            out(i1,i2,j1,j2,10)=k;
            out(i1,i2,:,:,k)=0;
            out(:,:,j1,j2,k)=0;
            out(i1,:,j1,:,k)=0;
            out(i1,i2,j1,j2,k)=1;
        end
    end
    % column
    for j=1:9
        j1=floor((j-1)/3)+1;
        j2=j-3*(j1-1);
        v=in(:,:,j1,j2,k);
        [i1,i2]=single2(v);
        
        if i1>0 && i2>0
            out(i1,i2,j1,j2,10)=k;
            out(i1,i2,:,:,k)=0;
            out(:,:,j1,j2,k)=0;
            out(i1,:,j1,:,k)=0;
            out(i1,i2,j1,j2,k)=1;
        end
    end
    % macrocell
    for i1=1:3
        for j1=1:3
            v=in(i1,:,j1,:,k);
            [i2,j2]=single2(v);
            if i2>0 && j2>0
                out(i1,i2,j1,j2,10)=k;
                out(i1,i2,:,:,k)=0;
                out(:,:,j1,j2,k)=0;
                out(i1,:,j1,:,k)=0;
                out(i1,i2,j1,j2,k)=1;
            end
        end
    end
        
end

end