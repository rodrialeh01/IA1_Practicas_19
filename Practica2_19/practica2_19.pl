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

% >>>>>> SUBCLASES
%subgenero -> genero
subclase_de(barroca,clasica).
subclase_de(romanticismo,clasica).
subclase_de(dembow,reggaeton).
subclase_de(techno,electronica).
subclase_de(edm,electronica).
subclase_de(house,electronica).
subclase_de(rock_pesado,electronica).
subclase_de(rock_clasico,electronica).
subclase_de(kpop, pop).

%genero -> musica
subclase_de(clasica, musica).
subclase_de(reggaeton, musica).
subclase_de(electronica, musica).
subclase_de(rock, musica).
subclase_de(pop, musica).

% >>>>>> PROPIEDADES
%cancion - compuesta_por -> autor
tiene_propiedad(las_cuatro_estaciones, compuesta_por, antonio_vivaldi).
tiene_propiedad(la_clave_bien_temperado, compuesta_por, johann_sebastian_bach).
tiene_propiedad(concierto_para_piano2, compuesta_por, rachmaninov).
tiene_propiedad(woman, compuesta_por, doja_cat).
tiene_propiedad(strings_of_life, compuesta_por, derrick_may).
tiene_propiedad(levels, compuesta_por, avicii).
tiene_propiedad(one_more_time, compuesta_por, daft_punk).
tiene_propiedad(paranoid, compuesta_por, black_sabbath).
tiene_propiedad(i_want_to_break_free, compuesta_por, queen).
tiene_propiedad(dynamite, compuesta_por, bts).

% >>>>>> REGLAS
%regla para saber si un objeto es una instacia de una clase en concreto
es(Clase, Obj):- instancia_de(Obj, Clase).
es(Clase, Obj):- instancia_de(Obj, Clasep),
                 subc(Clasep, Clase).

%Regla para saber si una clase es subclase de otra
subc(C1, C2):- subclase_de(C1, C2).
subc(C1, C2):- subclase_de(C1, C3),
               subc(C3, C2).

%Regla para saber si un objeto tiene una propiedad
propiedad(Obj, Prop):- es(Clase,Obj),
                       tiene_propiedad(Clase,Propiedad,Clase2),
                       Prop=.. [Propiedad, Clase2].