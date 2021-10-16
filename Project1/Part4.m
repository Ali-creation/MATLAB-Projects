
tspan = [0 5];
v0 = 0;
[t,v] = ode45(@velocity, tspan, v0);
vref = 2*t;
% Plot section
plot(t,v)
hold on
plot(t,vref,'--sr','linewidth',1)
xlabel('"Time" t (s)')
ylabel('Speed v(t)')
title('P1-PartD')
legend('Vehicle Speed v(t)', 'Reference Speed vref(t)');

function dv = velocity(t, v)
dv = 1-(2*v)+(4*t);
end
