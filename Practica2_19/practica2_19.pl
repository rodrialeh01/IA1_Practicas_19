%-----------------HECHOS----------------------------
% >>>>>> INSTANCIAS
%Instancia de canciones a sus subgeneros
%cancion -> barroca
instancia_de(las_cuatro_estaciones, barroca).
instancia_de(la_clave_bien_temperado, barroca).
%cancion -> romanticismo
instancia_de(concierto_para_piano2, romanticismo).
%cancion -> dembow
instancia_de(woman,dembow).
%cancion ->techno
instancia_de(strings_of_life, techno).
%cancion -> EDM
instancia_de(levels,edm).
%cancion -> house
instancia_de(one_more_time,house).
%cancion -> rock pesado
instancia_de(paranoid, rock_pesado).
%cancion -> rock clasico
instancia_de(i_want_to_break_free, rock_clasico).
%cancion -> KPOP
instancia_de(dynamite,kpop).

% >>>>>> SUB SUBCLASES
%subgenero -> genero
sub_subclase_de(barroca,clasica).
sub_subclase_de(romanticismo,clasica).
sub_subclase_de(dembow,reggaeton).
sub_subclase_de(techno,electronica).
sub_subclase_de(edm,electronica).
sub_subclase_de(house,electronica).
sub_subclase_de(rock_pesado,electronica).
sub_subclase_de(rock_clasico,electronica).
sub_subclase_de(kpop, pop).

% >>>>>> SUBCLASES
%genero -> musica
subclase_de(clasica, musica).
subclase_de(reggaeton, musica).
subclase_de(electronica, musica).
subclase_de(rock, musica).
subclase_de(pop, musica).

% >>>>>> PROPIEDADES
%subgenero - compuesta_por -> autor
tiene_propiedad(barroca, lo_compone, johann_sebastian_bach).
tiene_propiedad(romanticismo, lo_compone, rachmaninov).
tiene_propiedad(reggaeton, lo_canta, doja_cat).
tiene_propiedad(techno, lo_reproduce, derrick_may).
tiene_propiedad(edm, lo_reproduce, avicii).
tiene_propiedad(house, lo_reproduce, daft_punk).
tiene_propiedad(rock_pesado, lo_canta, black_sabbath).
tiene_propiedad(rock_clasico, lo_canta, queen).
tiene_propiedad(kpop, lo_canta, bts).
tiene_propiedad(rock, surgio_en, estados_unidos).
tiene_propiedad(pop, surgio_en, espania).
tiene_propiedad(kpop, surgio_en, corea_del_sur).

% >>>>>> REGLAS
%regla para saber si un objeto es una instacia de una clase en concreto
es(Clase, Obj):- instancia_de(Obj, Clase).
es(Clase, Obj):- instancia_de(Obj, Clasep),
                 sub_subc(Clasep, Clase).
es(Clase, Obj):- instancia_de(Obj, Clasep),
                 subc(Clasep, Clase2).
es(Clase, Obj):- instancia_de(Obj, Clasep),
                 sub_subc(Clasep, Clase2),
                 subc(Clase2, Clase3),
                 subc(Clase3, Clase).

%Regla para saber si una clase es subclase de otra
subc(C1, C2):- subclase_de(C1, C2).
subc(C1, C2):- subclase_de(C1, C3),
               subc(C3, C2).

%Regla para saber si una clase es subclase de otra
sub_subc(C1, C2):- sub_subclase_de(C1, C2).
sub_subc(C1, C2):- sub_subclase_de(C1, C3),
                   sub_subc(C3, C2).

%Regla para saber si un objeto tiene una propiedad
propiedad(Obj, Prop):- es(Clase,Obj),
                       tiene_propiedad(Clase,Propiedad,Clase2),
                       Prop=.. [Propiedad, Clase2].