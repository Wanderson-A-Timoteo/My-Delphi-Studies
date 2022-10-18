SELECT

tab.* ,

(tb_tipocontribuinte.descricao)tipocontrib ,
(clienteresp.nome)responsavel ,
(rotas.descricao)rota ,
(profissoes.descricao)profissao,
(tiposclientes.abreviatura)

FROM  CLIENTES tab

LEFT JOIN tb_tipocontribuinte tb_tipocontribuinte ON tb_tipocontribuinte.codigo = tab.coditipocontribuinte
LEFT JOIN clientes clienteresp ON clienteresp.codigo = tab.codiclipai
LEFT JOIN rotas rotas ON rotas.codigo = tab.codirota
LEFT JOIN profissoes profissoes ON profissoes.codigo = tab.codiprofissao
LEFT JOIN convenios convenios ON convenios.codigo = tab.codiconv
LEFT JOIN tiposclientes tiposclientes ON tiposclientes.codigo = tab.codiclassifcli

WHERE tab.codigo = :codigo

[grid]

SELECT

(tab.codigo) , (tab.nome) , (tab.cnpj_cpf) , 
(tab.fone1) , (tab.descrifone1) , 
(tab.email) , 
(tab.cep) , 
(tab.endereco) , (tab.numero) , (tab.apto) , (tab.bloco) , (tab.complemento) ,

(bairros.descricao)bairro ,
(cidades.descricao)cidade ,
(ufs.descricao)uf 

FROM  CLIENTES tab

LEFT JOIN ufs ufs ON ufs.codigo = tab.codiuf
LEFT JOIN cidades cidades ON cidades.codigo = tab.codicidade
LEFT JOIN bairros bairros ON bairros.codigo = tab.codibairro


