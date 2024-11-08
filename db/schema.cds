namespace automotiva;

using { managed } from '@sap/cds/common';

entity Veiculos : managed
{
    key ID_Veiculo : Integer;
    Nome_Modelo : String(100);
    Ano_Lancamento : Integer;
    Tipo_Veiculo : Integer enum
    {
        Sedan = 1;
        SUV = 2;
        Caminhão = 3;
        Outros = 4;
    };
    Motor : Integer enum
    {
        Elétrico = 1;
        Híbrido = 2;
        Combustão = 3;
        Outros = 4;
    };
    Categoria : Integer enum
    {
        Luxo = 1;
        Econômico = 2;
        Outros = 3;
    };
    Mercado_Alvo : String(100);
    Status_Desenvolvimento : String(30);
    Custo_Desenvolvimento : Decimal(15,2);
    Data_Inicio_Desenvolvimento : Date;
    key ID_Fornecedor : Integer;
    componentes : Association to many Componentes on ID_Veiculo = componentes.ID_Veiculo;
    fornecedores : Association to one Fornecedores;
}

entity Componentes
{
    key ID_Componente : Integer;
    key ID_Veiculo : Integer;
    Nome_Componente : String(100);
    Tipo_Componente : String(50);
    Custo_Componente : Decimal(9,2);
    Peso_Componente : Decimal(10,2);
    Data_Inclusao : Date;
    Fabricante : String(100);
    veiculos : Association to one Veiculos;
}

entity Fornecedores
{
    key ID_Fornecedor : Integer;
    Nome_Fornecedor : String(100);
    Localizacao : String(50);
    Tipo_Fornecedor : Integer enum
    {
        Primário = 1;
        Secundário = 2;
        Outros = 3;
    };
    Qualidade_Avaliacao : Integer;
    Data_Contrato : Date;
    Condicoes_Entrega : LargeString;
    veiculos : Association to many Veiculos on veiculos.ID_Fornecedor = ID_Fornecedor;
}