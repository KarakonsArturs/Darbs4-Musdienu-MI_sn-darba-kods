%Ekrāna logi jautājumu uzdošanai
%
suggest(Muzika, Dziedasana, Noskanojums, Temps):-
	write('Temps - atrs/lens'),
    read(Temps),
    write('Mūzikas izpildijums - instrumentals/elektronisks'),
    read(Muzika),
    write('Dziedāšana - dzied/nedzied'),
    read(Dziedasana),
    write('Mūzikas noskaņojums - priecigs/bedigs'),
    read(Noskanojums).

%Zināšanu bāzes noteikumi
%
ir_instrumentals(Muzika):- Muzika = instrumentals.
ir_priecigs(Noskanojums):- Noskanojums = priecigs.
ir_bedigs(Noskanojums, Temps):- Noskanojums = bedigs; Temps = lens.
ir_dejojams(Noskanojums, Temps):- Noskanojums = priecigs; Temps = atrs.
ir_atrs(Temps):- Temps = atrs.
ir_dziedasana(Dziedasana):- Dziedasana = dzied.
nav_dziedasana(Dziedasana):- Dziedasana = nedzied.
ir_lens(Temps):- Temps = lens.
ir_energisks(Noskanojums, Temps):- Noskanojums = priecigs, Temps = atrs.
ir_elektronisks(Muzika):- Muzika = elektronisks.
ir_viegls(Noskanojums, Temps):- Noskanojums = bedigs; Temps = lens.


%Iespējamie rezultāti un to nosacījumi
%
genre(Muzika, Dziedasana, Noskanojums, Temps):-
    ir_elektronisks(Muzika),
    ir_dziedasana(Dziedasana),
    ir_energisks(Noskanojums, Temps),
    ir_priecigs(Noskanojums),
    write('Mes jums iesakam "Pop" muziku').

genre(Muzika, Dziedasana, Noskanojums, Temps):-
    ir_elektronisks(Muzika),
    nav_dziedasana(Dziedasana),
    ir_energisks(Noskanojums, Temps),
    ir_dejojams(Noskanojums, Temps),
    write('Mes jums iesakam "Hip-Hop" muziku').

genre(Muzika, Dziedasana, Noskanojums, Temps):-
    ir_atrs(Temps),
    ir_dziedasana(Dziedasana),
    ir_instrumentals(Muzika),
    ir_energisks(Noskanojums, Temps),
    write('Mes jums iesakam "Rock" muziku').

genre(Muzika, Dziedasana, Noskanojums, Temps):-
	ir_bedigs(Noskanojums, Temps),
    nav_dziedasana(Dziedasana),
    ir_instrumentals(Muzika),
    ir_viegls(Noskanojums, Temps),
    write('Mes jums iesakam "Classic" muziku').

genre(Muzika, Dziedasana, Noskanojums, Temps):-
    ir_lens(Temps),
    ir_dziedasana(Dziedasana),
    ir_viegls(Noskanojums, Temps),
    ir_instrumentals(Muzika),
    write('Mes jums iesakam "Soul" muziku').

genre(_,_ ,_ ,_):-
    write('Atvainojiet sobrit jums ieteikumu nevaram sniegt').

% Programmas uzsākšana (konsolē ierakstīt "start.")
start:-
	suggest(Muzika, Dziedasana, Noskanojums, Temps),
    genre(Muzika, Dziedasana, Noskanojums, Temps).
    


