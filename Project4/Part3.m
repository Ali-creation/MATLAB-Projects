
Ci = zeros(3,3);
Ci(1,1) = 1; Ci(1,2) = 1; Ci(1,3) = 1; 
Ci(2,1) = 2; Ci(2,2) = 2; Ci(2,3) = 2; 
Ci(3,1) = 2; Ci(3,2) = 2; Ci(3,3) = 2; 
Bi_t = zeros(3,3);
Bi_t(1,1) = 0.5; Bi_t(1,2) = 0.5; Bi_t(1,3) = 0.5;
Bi_t(2,1) = 0.5; Bi_t(2,2) = 0.5; Bi_t(2,3) = 0.5;
Bi_t(3,1) = 1.05; Bi_t(3,2) = 1.1; Bi_t(3,3) = 1.15;

L_t = 1;
d_i_t = 1;
D = 20;
M1 = 3; M2 = 3; M3 = 5;
miu = 5;
a = 0.1; b = 0.02; c = 0.1;
s_i_t = 1;

alpha_i_t = zeros(3,3);
alpha_i_t(1,1) = 0.1; alpha_i_t(1,2) = 0.1; alpha_i_t(1,3) = 0.1;
alpha_i_t(2,1) = 0.2; alpha_i_t(2,2) = 0.2; alpha_i_t(2,3) = 0.2;
alpha_i_t(3,1) = 0.11; alpha_i_t(3,2) = 0.12; alpha_i_t(3,3) = 0.13;

beta_i = zeros(3,3);
for i = 1:3
    for j = 1:3
        beta_i(i,j) = 0.05;
    end
end

lambda_i_t = zeros(3,3);
%here I used randfixedsum, credit goes to: 
%https://www.mathworks.com/matlabcentral/fileexchange/9700-random-vectors-with-fixed-sum
for i = 1:3
    lambda_i_t(:,i) = randfixedsum(3,1,L_t,0,1000); 
end

x_i_t = zeros(3,3);
x_i_t(1,:) = randperm(M1,3); 
x_i_t(2,:) = randperm(M2,3); 
x_i_t(3,:) = randperm(M3,3); 

E_i_t = zeros(3,3);

for i = 1:3
    for j = 1:3
        E_i_t(i,j) = a*lambda_i_t(i,j) + b*x_i_t(i,j) + c;
    end
end

Si_t = zeros(3,3);
for i = 1:3
    for j = 1:3
        Si_t(i,j) = E_i_t(i,j) + (alpha_i_t(i,j)/beta_i(i,j)).*rand(1,1);
    end
end

objective_2 = 0;
for i = 1:3
    for j = 1:3
        objective_2 = objective_2 + (alpha_i_t(i,j) + beta_i(i,j)*(E_i_t(i,j) - s_i_t)) * E_i_t(i,j);
    end
end

%Ei_t = zeros(3,3);
%Ei_t(1,1) = 0.171172108577847; Ei_t(1,2) = 0.233502299277806; Ei_t(1,3) = 0.220211956628711;
%Ei_t(2,1) = 0.175329462169765; Ei_t(2,2) = 0.122264832945036; Ei_t(2,3) = 0.167652368214719;
%Ei_t(3,1) = 0.153498429252387; Ei_t(3,2) = 0.144232867777158; Ei_t(3,3) = 0.172135675156570;


theta = 0.5;
objective = 0;

for i = 1:3
    for j = 1:3
        objective = objective + theta*(E_i_t(i,j)+Bi_t(i,j))*(E_i_t(i,j)+Bi_t(i,j))/Ci(i,j) + (1-theta)*beta_i(i,j)*(Si_t(i,j)-E_i_t(i,j))*E_i_t(i,j);
    end
end






