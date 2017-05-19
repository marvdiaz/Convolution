clc
clear
clf

x = @(t) 2*(t>=0 & t<2);
g = @(t) (t>=-1 & t<1);

dtau = 0.5;
tau = -5:dtau:6;

t = -3:0.5:6;
y = NaN*zeros(1, length(t));


for ii=1:length(t)
    xg = g(t(ii)-tau).*x(tau);
    lxh = length(xg);
    y(ii)=trapz(tau,xg);
    
    subplot(2,1,1)
    plot(tau,x(tau), 'k-', tau, g(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); axis ([tau(1) tau(end) -2.0 2.5]); grid;
    legend('x(\tau)','g(t-\tau)');
    
    subplot(2,1,2), plot(t, y, 'k', t(ii), y(ii), 'ok');
    xlabel('t'); ylabel('y(t) = \int x(\tau)g(t-\tau) d\tau');
    axis([tau(1) tau(end) -1.0 5.0]); grid;
    drawnow;
    
end
