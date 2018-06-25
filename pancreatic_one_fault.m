% One fault network

function output = pancreatic_one_fault(fault1, x1, x2, x3, x4, x5)

    % Inputs
    EGF = 0; HBEGF = 0; IGF = 0; NRG1 = 0; PTEN = 1; LKB1 = 1;

    % Drugs
    CRY = x1; LY294002 = x2; Temsirolimus = x3; Lapatinib = x4; HO3867 = x5;

    if (fault1 == 1)
        EGFR = 1; 
    else
        EGFR = EGF; 
    end
    
    if (fault1 == 2)
        EFGR = 1;
    else
        EFGR = EGF | HBEGF;
    end
    
    if (fault1 == 3)
        IFGR1AB = 1;
    else
        IFGR1AB = IGF;
    end
    
    if (fault1 == 4)
        ERBB2 = 1;
    else
        ERBB2 = NRG1;
    end
    
    if (fault1 == 5)
        JAK1 = 1;
    else
        JAK1 = (EGFR & ~Lapatinib);
    end
    
    if (fault1 == 6)
        STAT3 = 1;
    else
        STAT3 = JAK1;
    end
    
    if (fault1 == 7)
        IRS1 = 1;
    else
        IRS1 = IFGR1AB;
    end
    
    if (fault1 == 8)
        GRB2 = 1;
    else
        GRB2 = ((EGFR & ~Lapatinib)| (EFGR & ~Lapatinib) | IFGR1AB | (ERBB2 & ~Lapatinib));
    end
        
    if (fault1 == 9)
        RAS = 1;
    else
        RAS = GRB2;
    end
    
    if (fault1 == 10)
        MEKK1 = 1;
    else
        MEKK1 = RAS;
    end
    
    if (fault1 == 11)
        RAF = 1;
    else
        RAF = RAS;
    end
    
    if (fault1 == 12)
        MKK4 = 1;
    else
        MKK4 = MEKK1;
    end
    
    if (fault1 == 13)
        MEK1 = 1;
    else
        MEK1 = RAF;
    end    

    if (fault1 == 14)
        PIK3CA = 1;
    else
        PIK3CA = (RAS | (STAT3 & (~CRY & ~HO3867)) | (IRS1) | (ERBB2 & ~Lapatinib));
    end 
    
    if (fault1 == 15)
        JNK1 = 1;
    else
        JNK1 = MKK4;
    end 

    if (fault1 == 16)
        ERK1 = 1;
    else
        ERK1 = MEK1;
    end 
    
    if (fault1 == 17)
        PIP3 = 1; 
    else
        PIP3 = ((PIK3CA & ~LY294002) | (~PTEN)); 
    end 
    
    if (fault1 == 18)
        PDPK1 = 1;
    else
        PDPK1 = PIP3;
    end
    
    if (fault1 == 19)
        AKT = 1;
    else
        AKT = PIP3;
    end
    
    if (fault1 == 20)
        AMPK = 1;
    else
        AMPK = LKB1;
    end

    if (fault1 == 21)
        GSK3 = 0;
    else
        GSK3 = ~(AKT); 
    end
    
    if (fault1 == 22)
        TSC1 = 0;
    else
        TSC1 = (AMPK | ~(AKT)); 
    end
    
    if (fault1 == 23)
        RHEB = 1;
    else
        RHEB = ~TSC1;
    end
    
    if (fault1 == 24)
        mTOR = 1;
    else
        mTOR = RHEB;
    end
    
    if (fault1 == 25)
       RPS6KB1 = 1; 
    else
       RPS6KB1 = ((ERK1 & ~CRY) | PDPK1 | (mTOR & ~(Temsirolimus))); 
    end
    
    if (fault1 == 26)
       BAD = 0; 
    else
       BAD = ~(RPS6KB1 | (AKT)); 
    end

    
    CCND1 = ~GSK3; 
    BCL2 = ((STAT3 & (~CRY & ~HO3867)) & ~BAD);
    SRFELK1 = (ERK1 & ~CRY) & RPS6KB1; 
    FOSJUN = JNK1 & RPS6KB1;
    SRFELK4 = (ERK1 & ~CRY) & RPS6KB1; 
    SP1 = (ERK1 & ~CRY); 
    
    output1 = [CCND1, BCL2, SRFELK1, FOSJUN, SRFELK4, SP1];
    output2 = [0,0,0,0,0,0]; % Ideal Output
    
    
    % Check the difference in outputs
    a=0; b=0; c=0; d=0;
    for i = 1:6
        if output1(i) == 1 && output2(i) == 1
            a=a+1; 
        elseif output1(i) == 0 && output2(i) == 1
            b=b+1; 
        elseif output1(i) == 1 && output2(i) == 0
            c=c+1; 
        elseif output1(i) == 0 && output2(i) == 0
            d=d+1; 
        end
    end

    output = ((b+c)^2)/((a+b+c+d)^2);
end