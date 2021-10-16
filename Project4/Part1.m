
Ci = zeros(3,3);
Ci(1,1) = 1; Ci(1,2) = 1; Ci(1,3) = 1; 
Ci(2,1) = 2; Ci(2,2) = 2; Ci(2,3) = 2; 
Ci(3,1) = 2; Ci(3,2) = 2; Ci(3,3) = 2; 
Bi_t = zeros(3,3);
Bi_t(1,1) = 0.5; Bi_t(1,2) = 0.5; Bi_t(1,3) = 0.5;
Bi_t(2,1) = 0.5; Bi_t(2,2) = 0.5; Bi_t(2,3) = 0.5;
Bi_t(3,1) = 1.05; Bi_t(3,2) = 1.1; Bi_t(3,3) = 1.15;
qi_t = zeros(3,3);

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


for i = 1:3
    for j = 1:3
        qi_t(i,j) = Ci(i,j) - Bi_t(i,j);
    end
end

Ei_t = zeros(3,3);

for i = 1:3
    for j = 1:3
        Ei_t(i,j) = qi_t(i,j) .* rand(1,1);
    end
end

Si_t = zeros(3,3);
for i = 1:3
    for j = 1:3
        Si_t(i,j) = Ei_t(i,j) + (alpha_i_t(i,j)/beta_i(i,j)).*rand(1,1);
    end
end

theta = 0.5;
objective = 0;

for i = 1:3
    for j = 1:3
        objective = objective + theta*(Ei_t(i,j)+Bi_t(i,j))*(Ei_t(i,j)+Bi_t(i,j))/Ci(i,j) + (1-theta)*beta_i(i,j)*(Si_t(i,j)-Ei_t(i,j))*Ei_t(i,j);
    end
end






