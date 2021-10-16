
global v0
v0=0;

for t= 0:0.1:10
    v0 = velocity(v0);
    plot(t,v0)
    plot(t,1,'linewidth',1)
    hold on
end

% Plot section
xlabel('"Time" t (s)')
ylabel('Speed v(t)')
title('P1-PartC')
legend('Reference Speed vref(t)', 'Vehicle Speed v(t)');

function v = velocity(v_initial)
v = 0.8*v_initial+0.2 ;
end
