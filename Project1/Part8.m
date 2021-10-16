global v0
v0=0;
global x0
x0=0;
global vp
vp = zeros(1,101);
count = 1;
for t= 0:0.1:10
    vp(count) = v0;
    v0 = velocity(v0);
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
title('P3-PartB')
legend('Reference Position xref(t)', 'Vehicle Position x(t)');

function v = velocity(v_initial)
v = 8.64 - 0.02*v_initial^2 + 0.84*v_initial ;
end

function x = position(x_initial,t,vp)
x = x_initial + vp(t*10+1);
end
