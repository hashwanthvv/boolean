n = 2; % The number of drug combinations

% Overall measure for single fault network
A = zeros(27,32);

% "i" iterates over faults, and d1, d2, d3, d4, d5 iterate over drugs
for i = 0:26
    for d1 = 0:1
        for d2 = 0:1
            for d3 = 0:1
                for d4 = 0:1
                    for d5 = 0:1
                        m = 16*d1 + 8*d2 + 4*d3 + 2*d4 + d5 + 1;
                        if (d1+d2+d3+d4+d5 <= n) 
                           A(i+1,m) = pancreatic_one_fault(i,d1,d2,d3,d4,d5);
                        end
                    end
                end
            end
        end
    end
end

A = sum(A,1);  % Summing the measures across all faults
A = A(:,any(A,1)); % Removing the zero columns
A = A/max(abs(A(:))); % Normalising the measure 
A = A';



% Overall measure for two fault network
B = zeros(27,27,32);

% "i" and "j" iterate over faults, and d1, d2, d3, d4, d5 iterate over drugs
for i = 0:26
    for j = 0:26
        for d1 = 0:1
            for d2 = 0:1
                for d3 = 0:1
                    for d4 = 0:1
                        for d5 = 0:1
                            m = 16*d1 + 8*d2 + 4*d3 + 2*d4 + d5 + 1;
                            if (d1+d2+d3+d4+d5 <= n) 
                               B(i+1,j+1,m) = pancreatic_two_faults(i,j,d1,d2,d3,d4,d5);
                            end
                        end
                    end
                end
            end
        end
    end
end

B = sum(sum(B)); % Summing the measures across all faults
B = B(:,any(B,2)); % Removing the zero columns
B = B/max(abs(B(:))); % Normalising the measure 
B = B';



% Overall measure for three fault network
C = zeros(27,27,27,32);

% "i", "j", "k" iterate over faults, and d1, d2, d3, d4, d5 iterate over drugs
for i = 0:26
    for j = 0:26
        for k = 0:26
            for d1 = 0:1
                for d2 = 0:1
                    for d3 = 0:1
                        for d4 = 0:1
                            for d5 = 0:1
                                m = 16*d1 + 8*d2 + 4*d3 + 2*d4 + d5 + 1;
                                if (d1+d2+d3+d4+d5 <= n) 
                                    C(i+1,j+1,k+1,m) = pancreatic_three_faults(i,j,k,d1,d2,d3,d4,d5);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

C = sum(sum(sum(C))); % Summing the measures across different faults
C = C(:,any(C,2)); % Removing the zero columns
C = C/max(abs(C(:))); % Normalising the measure 
C = C';


% List of no combination of drugs
D1 = {'Untreated';
    'HO-3867';
    'Lapatinib';
    'Temsirolimus';
    'LY294002';
    'Cryptotanshinone'};

% List of two drug combinations
D2 = {'Untreated';
    'HO-3867';
    'Lapatinib';
    'Lapatinib + HO-3867';
    'Temsirolimus';
    'Temsirolimus + HO-3867';
    'Temsirolimus + Lapatinib';
    'LY294002';
    'LY294002 + HO-3867';
    'LY294002 + Lapatinib';
    'LY294002 + Temsirolimus';
    'Cryptotanshinone';
    'Cryptotanshinone + HO-3867';
    'Cryptotanshinone + Lapatinib';
    'Cryptotanshinone + Temsirolimus';
    'Cryptotanshinone + LY294002'};

% List of three drug combinations
D3 = {'Untreated';
    'HO-3867';
    'Lapatinib';
    'Lapatinib + HO-3867';
    'Temsirolimus';
    'Temsirolimus + HO-3867';
    'Temsirolimus + Lapatinib';
    'Temsirolimus + Lapatinib + HO-3867';
    'LY294002';
    'LY294002 + HO-3867';
    'LY294002 + Lapatinib';
    'LY294002 + Lapatinib + HO-3867';
    'LY294002 + Temsirolimus';
    'LY294002 + Temsirolimus + HO-3867';
    'LY294002 + Temsirolimus + Lapatinib';
    'Cryptotanshinone';
    'Cryptotanshinone + HO-3867';
    'Cryptotanshinone + Lapatinib';
    'Cryptotanshinone + Lapatinib + HO-3867';
    'Cryptotanshinone + Temsirolimus';
    'Cryptotanshinone + Temsirolimus + HO-3867';
    'Cryptotanshinone + Temsirolimus + Lapatinib';
    'Cryptotanshinone + LY294002';
    'Cryptotanshinone + LY294002 + HO-3867';
    'Cryptotanshinone + LY294002 + Lapatinib';
    'Cryptotanshinone + LY294002 + Temsirolimus'};

% List of four drug combinations
D4 = {'Untreated';
    'HO-3867';
    'Lapatinib';
    'Lapatinib + HO-3867';
    'Temsirolimus';
    'Temsirolimus + HO-3867';
    'Temsirolimus + Lapatinib';
    'Temsirolimus + Lapatinib + HO-3867';
    'LY294002';
    'LY294002 + HO-3867';
    'LY294002 + Lapatinib';
    'LY294002 + Lapatinib + HO-3867';
    'LY294002 + Temsirolimus';
    'LY294002 + Temsirolimus + HO-3867';
    'LY294002 + Temsirolimus + Lapatinib';
    'LY294002 + Temsirolimus + Lapatinib + HO-3867';
    'Cryptotanshinone';
    'Cryptotanshinone + HO-3867';
    'Cryptotanshinone + Lapatinib';
    'Cryptotanshinone + Lapatinib + HO-3867';
    'Cryptotanshinone + Temsirolimus';
    'Cryptotanshinone + Temsirolimus + HO-3867';
    'Cryptotanshinone + Temsirolimus + Lapatinib';
    'Cryptotanshinone + Temsirolimus + Lapatinib + HO-3867';
    'Cryptotanshinone + LY294002';
    'Cryptotanshinone + LY294002 + HO-3867';
    'Cryptotanshinone + LY294002 + Lapatinib';
    'Cryptotanshinone + LY294002 + Lapatinib + HO-3867';
    'Cryptotanshinone + LY294002 + Temsirolimus';
    'Cryptotanshinone + LY294002 + Temsirolimus + HO-3867';
    'Cryptotanshinone + LY294002 + Temsirolimus + Lapatinib'};

% List of five drug combinations
D5 = {'Untreated';
    'HO-3867';
    'Lapatinib';
    'Lapatinib + HO-3867';
    'Temsirolimus';
    'Temsirolimus + HO-3867';
    'Temsirolimus + Lapatinib';
    'Temsirolimus + Lapatinib + HO-3867';
    'LY294002';
    'LY294002 + HO-3867';
    'LY294002 + Lapatinib';
    'LY294002 + Lapatinib + HO-3867';
    'LY294002 + Temsirolimus';
    'LY294002 + Temsirolimus + HO-3867';
    'LY294002 + Temsirolimus + Lapatinib';
    'LY294002 + Temsirolimus + Lapatinib + HO-3867';
    'Cryptotanshinone';
    'Cryptotanshinone + HO-3867';
    'Cryptotanshinone + Lapatinib';
    'Cryptotanshinone + Lapatinib + HO-3867';
    'Cryptotanshinone + Temsirolimus';
    'Cryptotanshinone + Temsirolimus + HO-3867';
    'Cryptotanshinone + Temsirolimus + Lapatinib';
    'Cryptotanshinone + Temsirolimus + Lapatinib + HO-3867';
    'Cryptotanshinone + LY294002';
    'Cryptotanshinone + LY294002 + HO-3867';
    'Cryptotanshinone + LY294002 + Lapatinib';
    'Cryptotanshinone + LY294002 + Lapatinib + HO-3867';
    'Cryptotanshinone + LY294002 + Temsirolimus';
    'Cryptotanshinone + LY294002 + Temsirolimus + HO-3867';
    'Cryptotanshinone + LY294002 + Temsirolimus + Lapatinib';
    'Cryptotanshinone + LY294002 + Temsirolimus + Lapatinib + HO-3867'};


if n==1
    output_one_fault = [D1,num2cell(A)];
    output_two_faults = [D1,num2cell(B)];
    output_three_faults = [D1,num2cell(C)];
elseif n==2
    output_one_fault = [D2,num2cell(A)];
    output_two_faults = [D2,num2cell(B)];
    output_three_faults = [D2,num2cell(C)];
elseif n==3
    output_one_fault = [D3,num2cell(A)];
    output_two_faults = [D3,num2cell(B)];
    output_three_faults = [D3,num2cell(C)];
elseif n==4
    output_one_fault = [D4,num2cell(A)];
    output_two_faults = [D4,num2cell(B)];
    output_three_faults = [D4,num2cell(C)];
elseif n==5
    output_one_fault = [D5,num2cell(A)];
    output_two_faults = [D5,num2cell(B)];
    output_three_faults = [D5,num2cell(C)];
end

display(output_one_fault);
display(output_two_faults);
display(output_three_faults);