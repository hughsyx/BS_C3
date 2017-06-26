function [Xwig, Ywig ] = iwigdata( X, Y, basevalue )
% iwigdata generate wiggle data for plotting by inserting the cross points
% at the basevalue.
% '*' is the original data point for Y(i)at X(i)
% iwigdata will insert an extra point '^' where the line Y(i) to Y(i+1)
% across the lin y=basevalue.
%  Y
%  |      * 
%--|---------^(add cross point at the basevalue)------X ('----': y=basevalue)
%  |            *  

%% find the position of zeros (ind_zeros, Xzeros)
if length(X)~=length(Y)
		error('time and amplitude array should be the same length!')
end

ind = Y>basevalue;
ind_diff = ind(2:end)-ind(1:end-1);
ind_zeros = find(abs(ind_diff)>0);

nzeros = length(ind_zeros);
Xzeros = zeros(1,nzeros);

for i = 1:nzeros
    delta = (Y(ind_zeros(i))-basevalue)/(Y(ind_zeros(i))-Y(ind_zeros(i)+1))...
        *(X(ind_zeros(i)+1)-X(ind_zeros(i)));
    Xzeros(i) = X(ind_zeros(i))+delta;
end

%% insert zeros into X and basevalue to Y at the cross points
Xadd = iinsert(X,ind_zeros,Xzeros);
Yadd = iinsert(Y,ind_zeros,basevalue*ones(1,nzeros));
%% add points at both begin and end with y value = basevalue
Xwig = [Xadd(1) Xadd Xadd(end)];
Ywig = [basevalue Yadd basevalue];


% area(Xadd,Yadd.*(Yadd>=basevalue),'BaseValue',basevalue,'FaceColor',[1 0 0],'edgecolor','none')
% hold on
% %area(Xins,Yins.*(Yins<basevalue),'BaseValue',basevalue,'FaceColor',[0 1 0],'edgecolor','none')
% line(X,Y,'color','k')


%% nested function
function [ Xadd ] = iinsert(X,ind,Xins)
% insert Xins into X at positions given by ind
% e.g. ind(i)=5 meas insert Xins after X(5) with Xins(i)
% Note: ind should be sort with ascending order 
%
    nX = length(X);
    nind = length(ind);
    Xadd = zeros(1,nX+nind);
    %
    % no intersection point to add (e.g all the Y data are all greater or
    % smaller than basevalue)
    if isempty(ind) 
        Xadd(1:end) = X; 
        % this assignment style a(1:end)=b ensurs the dimesion of a is not
        % changed when a is a column vecotr while b is a row vector.
        return
    end
    %
    indX0 = 1;
    indXadd0 = 1;
    %
    for k = 1:nind
        indXadd1 = indXadd0+ind(k)-indX0;
        Xadd(indXadd0:indXadd1) = X(indX0:ind(k));
        Xadd(indXadd1+1) = Xins(k);
        indX0 = ind(k)+1;
        indXadd0 = indXadd1+2;
    end
    if ind(end) < nX
        Xadd(indXadd0:end) = X(indX0:end);
    end
end

end