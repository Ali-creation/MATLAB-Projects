
global v0
%v0=0;
t= 0:0.1:10;
v0= NaN(numel(t),1);
v0(1,1) = 0;

for t= 0:0.1:10
    x = int64(t*10+2);
    v0(x,1) = velocity(v0(x-1,1),t);
end
t= 0:0.1:10.1;
plot(t,v0);
hold on
plot(t,2*t);

% Plot section
xlabel('"Time" t (s)')
ylabel('Speed v(t)')
title('P1-PartD')
legend('Reference Speed vref(t)', 'Vehicle Speed v(t)');

function v = velocity(v_initial,t)
v = 0.8*v_initial +0.4*t +0.1 ;
end
