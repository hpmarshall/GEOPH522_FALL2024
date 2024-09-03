function [kde] = kernel_pdf(D,xm,h)
%creates a kernel density estimate
% INPUT: D = vector of 1D data
%             xm = location of pdf  estimates
%             h = window size
% OUTPUT: kde = kernel density estimate
% SNTX: [kde] = kernel_pdf(D,xm,h)
dx=xm(2)-xm(1);
for n=1:length(xm)
    x0=xm(n); 
    dist=D-x0; % distance from x0 to all data
    Ix=find(abs(dist)<h); % finding data within window h
    w=15/16*(1-(dist(Ix)/h).^2).^2; % bisquare kernel
    kde(n)=sum(w);
end
kde=kde/(sum(kde*dx)); % normalize