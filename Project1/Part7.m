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
    plot(t,3*t,'--.r','linewidth',1)
    hold on
end


% Plot section
xlabel('"Time" t (s)')
ylabel('Position x(t)')
title('P3-PartA')
legend('Reference Position xref(t)', 'Vehicle Position x(t)');

function v = velocity(v_initial)
v = 0.48 + v_initial - 0.1*v_initial^2 ;
end

function x = position(x_initial,t,vp)
x = x_initial + vp(t*10+1);
end
