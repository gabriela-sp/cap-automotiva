const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {
    const srv = await cds.connect.to('db')

    const validarAno = async ano => {
        const anoAtual = new Date().getFullYear();

        if (ano > anoAtual) {
            throw new Error("O ano inserido é maior que o ano atual.");
        }
    }

    this.before('CREATE', 'Veiculos', async req => {
        const data = req.data
        let iTest = await validarAno(data.Ano_Lancamento)
    })
});