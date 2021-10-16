
clear
global v0
v0=0;
global x0
x0=0;
global vp
vp = zeros(1,101);
count = 1;

variance = 8;

for t= 0:0.1:10
    noise = sqrt(variance)*randn(1);
    vp(count) = v0;
    v0 = velocity(v0,t)+noise;
    count = count +1;
end

for t=0:10
    x0 = position(x0,t,vp);
    plot(t,x0,'--.b','LineWidth',1)
    xref = 3*t^2;
    plot(t,xref,'--.r','linewidth',1)
    hold on
end

% Plot section
xlabel('"Time" t (s)')
ylabel('Position x(t)')
title('P4')
legend('Reference Position xref(t)', 'Vehicle Position x(t)');

function v = velocity(v_initial,t)
v = 0.8*v_initial +0.4*t +0.1 ;
end

function x = position(x_initial,t,vp)
x = x_initial + vp(t*10+1);
end