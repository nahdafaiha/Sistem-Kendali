disp('NAHDA FAIHA LAALI 19/445571/PA/19395');
K = 7500;
polinomial = [1 19 560 K];

    %% Show Polynomial
    poly2sym(polinomial)
    
    %% Building Routh tabel
    orde = length(polinomial);
    kolom = floor((orde+1)/2);
    Tabel = zeros(orde, kolom);
    stabil = false;
    i = 1;
    
    for row = 1:orde
        for col = 1:kolom
            if row < 3
                r = col;
                c = row;
                tabel(r,c) = polinomial(i);
                i = i + 1;
            else
                if col ~= kolom
                    r = row;
                    c = col;
                    tabel(r, c) = (tabel(row-1,1)*tabel(row-2,col+1)-tabel(row-2,1)*tabel(row-1,col+1))/tabel(row-1,1);
                end
            end
        
            if tabel(r, 1) < 0
                stabil = false;
            end
        end
    end
    
    %% Check the stablity
    if stabil
        fprintf('Sistem Tidak Stabil.\n\n');
    else
        fprintf('Sistem stabil.\n\n');
    end
    
    %% Print Routh tabel
    spaces = '           ';
    m = 12;
    if mod(orde ,2) == 0
        decrease = 1;
    else
        decrease = 0;
    end

    for r = 1 : orde
        if (orde-r) > 9
            separator = ' | ';
        else
            separator = '  | ';
        end
        
        fprintf(['s^',num2str(orde-r),separator])
        
        for c = 1:kolom
            aux = num2str(tabel(r,c));
            tam = length(aux);
            left = floor((m-tam)/2);
            rigth = m - tam - left;
            fprintf([spaces(1:left),aux,spaces(1:rigth),' | ']);
        end
        
        fprintf('\n')
        
        if decrease > 0
            decrease = decrease - 1;
        else
            if kolom ~= 1
                kolom = kolom - 1;
            end
            
            decrease = 1;
        end
    end
    
