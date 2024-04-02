function unctbode(G,omega,nunct)

[mattype,~,~,~] = minfo(G);
if(~strcmp(mattype,'syst'))
    error('G must be a system matrix')
end

delta = cell(nunct, 1);                             % vytvoreni pole bunek - pro budouci navratovou hodnotu funkce s libovolnym poctem navratovych hodnot
arg = cell(nunct, 1);                               % to same pro budouci argument jine funkce
for i = 1:nunct
    arg{i} = [-1 0 1];                              % naplneni bunek vektory s krajnimi hodnotami, bohuzel rucne - nelze vybrat naraz vsechny bunky
end

[delta{:}] = ndgrid(arg{:});                        % vsechny mozne kombinace krajnich hodnot libovolneho poctu neurcitosti    
deltavect = zeros(1,nunct);                         % priprava prazneho vektoru pro jednu kombinaci n neurcitosti
figure 
for j = 1:27                                        % vykresleni charakteristiky vsech kombinaci
    for k = 1:nunct
        deltavect(k) = delta{k,1}(j);               % naplneni vektoru jednou kombinaci n neurcitosti, zase rucne
    end  
    deltamat = diag(deltavect);                     % z vybraneho vektoru vytvori diagonalni matici Delta
    olp = starp(deltamat,G);                        % spojeni soustavy s blokem neurcitosti - ziskam soustavu pro jednu kombinaci neurcitosti                             
    olp_ic = sel(olp,1,1);                          % v tomto pripade neudela nic, u MIMO vybere dany vstup/vystup                                     
    olp_g = frsp(olp_ic,omega);                     % spocita frekvencni charakteristiku pro danou kombinaci neurcitosti, dany vstup/vystup a zadane frekvence
    vplot('bode',olp_g,'c-')
    subplot(2,1,1)                                  % hold on pro vykresleni char. vsech kombinaci 
    hold on
    subplot(2,1,2)
    hold on
end

hold off

end