using automotiva as auto from '../db/schema';

service Database {
    entity Veiculos as projection on auto.Veiculos;
    entity Componentes as projection on auto.Componentes;
    entity Fornecedores as projection on auto.Fornecedores;
}