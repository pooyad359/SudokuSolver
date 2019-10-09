function sudokusolver(sdk)
% input is string format sudoku
% input can be in either of the following formats
% a = [0     4     0     0     0     6     0     0     0
%      6     0     0     3     0     0     5     9     0
%      7     0     2     0     0     0     0     8     0
%      0     6     0     0     1     0     0     0     0
%      0     0     0     8     0     0     0     0     0
%      0     0     0     0     7     0     0     6     0
%      0     9     0     0     0     0     1     0     5
%      0     1     3     0     5     2     0     0     0
%      0     0     0     4     0     0     0     2     0]
%
% a = ['067000000
%       400600910
%       002000030
%       030080004
%       000107050
%       600000020
%       050000100
%       098006002
%       000000500']

tic
if ischar(sdk)
    sdk=sdkinput(sdk);
elseif prod(size(sdk)==[9,9])~=1 || ~isnumeric(sdk)
    error('bad input')
end
disp('The puzzle:')
sdkshow(sdk)
sol=sdk9to3(sdk);
sol=sngslv(sol);
disp('First attempt at solving the puzzle:')
sdkshow(sdk3to9(sol))
% display(toc)
fprintf('%.2f seconds\n',toc)
%%
for n=1:82
    j=floor((n-1)/9)+1;
    i=n-9*(j-1);
    i1=floor((i-1)/3)+1;
    i2=i-3*(i1-1);
    j1=floor((j-1)/3)+1;
    j2=j-3*(j1-1);
    if sol(i1,i2,j1,j2,10)==0
        break
    end
end
v=sol(i1,i2,j1,j2,1:9);
for k=9:-1:1
    if v(k)==0
        v(k)=[];
    else
        v(k)=k;
    end
end
sol0=sol;
n=length(v);
a=(sdk3to9(sol)==zeros(9));
a=sum(sum(a));
for k=1:n
    sol=sol0;
    fprintf('Calculating\t %.1f %% completed\n',(81-a+a*(k-1)/n)/81*100)
    nv=v(k);
    sol(i1,i2,j1,j2,10)=nv;
    sol(i1,i2,:,:,nv)=0;
    sol(:,:,j1,j2,nv)=0;
    sol(i1,:,j1,:,nv)=0;
    sol(i1,i2,j1,j2,nv)=1;
    [sol, c]=loopslv(sol);
    if c==1
        fprintf('Calculation completed\nFinal result:\n')
        fprintf('\n\n')
        
        sdkshow(sdk3to9(sol))
%         display(toc)
        fprintf('%.2f seconds\n',toc)
        return
    end
end
%%
fprintf('Unable to solve\n')

