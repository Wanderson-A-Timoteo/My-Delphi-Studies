SELECT

tab.* 

FROM  FUNCIONARIOS tab

WHERE tab.codigo = :codigo

[grid]

SELECT

(tab.codigo) , (tab.nome) , 
(tab.fone1) , (tab.descrifone1) , 
(tab.email) , 
(tab.cep) , 
(tab.endereco) , (tab.numero) , (tab.apto) , (tab.bloco) , (tab.complemento) ,

(bairros.descricao)bairro ,
(cidades.descricao)cidade ,
(ufs.descricao)uf 

FROM  FUNCIONARIOS tab

LEFT JOIN ufs ufs ON ufs.codigo = tab.codiuf
LEFT JOIN cidades cidades ON cidades.codigo = tab.codicidade
LEFT JOIN bairros bairros ON bairros.codigo = tab.codibairro

