SELECT

(tab.codigo) , (tab.codiemp) , (tab.nome) , (tab.razsoc) , (tab.pessoa) , 
(tab.dtcadastro) , (tab.cnpj_cpf) , (tab.cgf_rg) , 

(tab.fone1) , (tab.descrifone1) , (tab.fone2) , (tab.descrifone2) , 
(tab.fone3) , (tab.descrifone3) , (tab.fone4) , (tab.descrifone4) , 

(tab.email) , (tab.email2) ,(tab.site) ,

(tab.cep) , (tab.codiibge) ,
(tab.endereco) , (tab.numero) , (tab.apto) , (tab.bloco) , (tab.complemento) ,
(tab.codiuf) , (tab.codicidade) ,(tab.codibairro) , 

(tab.cep_entrega) , 
(tab.endereco_entrega) , (tab.numero_entrega) , (tab.apto_entrega) , (tab.bloco_entrega) , (tab.complemento_entrega) ,
(tab.codiuf_entrega) , (tab.codicidade_entrega) ,(tab.codibairro_entrega) , 

(tab.cep_cobranca) , 
(tab.endereco_cobranca) , (tab.numero_cobranca) , (tab.apto_cobranca) , (tab.bloco_cobranca) , (tab.complemento_cobranca) ,
(tab.codiuf_cobranca) , (tab.codicidade_cobranca) ,(tab.codibairro_cobranca) , 

(tab.orgaoemissor) , (tab.ufemissao_rg) , (tab.dtemissao_rg) , (tab.dtaniversario) , (tab.email_nfe) , (tab.inscrmunicipal) ,
(tab.coditipocontrib) , (tab.codiclipai) , 

(tab.bloqueado) , (tab.limitecredito) , (tab.codirota) , (tab.codiprofissao) , (tab.codiestcivil) , (tab.geo_latitude) ,
(tab.geo_longitude) , 
(tab.codiconv) , (tab.codiclassifcli) ,

(bairros.descricao)bairro ,
(cidades.descricao)cidade ,
(ufs.descricao)uf ,

(tb_tipocontrib.descricao)tipocontrib ,
(clientes.nome)responsavel ,
(rotas.descricao)rota ,
(profissoes.descricao)profissao

FROM  CLIENTES tab

LEFT JOIN ufs ufs ON ufs.codigo = tab.codiuf
LEFT JOIN cidades cidades ON cidades.codigo = tab.codicidade
LEFT JOIN bairros bairros ON bairros.codigo = tab.codibairro
LEFT JOIN tb_tipocontrib tb_tipocontrib ON tb_tipocontrib.codigo = tab.coditipocontrib
LEFT JOIN clientes clientes ON clientes.codigo = tab.codiclipai
LEFT JOIN rotas rotas ON rotas.codigo = tab.codirota
LEFT JOIN profissoes profissoes ON profissoes.codigo = tab.codiprofissao

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


