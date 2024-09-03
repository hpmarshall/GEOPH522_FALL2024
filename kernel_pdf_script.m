% kernel_pdf_script
% HPM 9/2/24
% demonstrate use of kernel_pdf.m function
mu=2.75;
sig=0.9;
D=mu+sig*randn(10000,1);
D2=(mu+3*sig)+(sig/2)*randn(1000,1);
D=[D;D2]; 
[nc,xbins]=hist(D,30);
rdh=nc/sum(nc*(xbins(2)-xbins(1)));
figure(1);clf
bar(xbins,rdh)
% now use kernel pdf and plot on top
xm=linspace(mu-5*sig,mu+5*sig,100);
h=0.5;
kde=kernel_pdf(D,xm,h);
hold on; plot(xm,kde,'r','linewidth',2)