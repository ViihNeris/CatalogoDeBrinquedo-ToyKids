# CatalogoDeBrinquedo-ToyKids
Este projeto refere-se a um desenvolvimento em grupo de um Catalogo de Brinquedos denominado "ToyKids". A entrega foi realizada ao tutor da disciplina requisitante no Ensino Superior da Universidade Cidade de São Paulo.

## O Projeto
- Foram utilizados HTML, CSS, JS para os elementos visuais, JAVA (com suporte do APACHE/TOMCAT) para processamento das requisições e SQL para manipulação do database;
- IDE: Eclipse for Enterprise Java and Web Developers.

### Home
É a primeira página visualizada pelo usuário. Nela ele tem acesso a todas as guias disponíveis através da <b>NavBar</b>, além de visualizar os itens em destaque (os quais são clicáveis e realizam redirecionamento para os <b>Detalhes do produto</b>, que você verá mais a frente). 
![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/d0f29f1c-6d02-45f6-85e1-a5346d7f43f4)

### Categorias
Existem 2 meios de visualizar itens da categoria desejada:
1.  Via <b>NavBar</b>, escolhendo diretamente a categoria desejada:
   
    ![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/b1d5af21-6d97-48a9-89d1-d4f280308cb9)

    ![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/2b6ea16f-3e19-4f4d-a759-99a8da9fca0d)


2.  Via <b>NavBar</b>, escolhendo visualizar TODAS as categorias disponíveis:

     ![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/27de824c-877a-405f-9b71-21e11d8f3c23)


     ![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/9cc1ed44-27ad-4faf-8e1c-be4fc6955835)

<i>OBS: Caso uma nova categoria seja inserida durante a adição de um novo item (que você verá mais a frente), um novo card será inserido nesta tela e uma nova linha será adicionada ao menu da navbar.</i>

### Detalhes do Produto
Esta tela é exibida após o usuário escolher visualizar um produto. Esta ação pode ser realizada clicando em cards com as informações principais do item (localizados na <b>Página Inicial</b> ou dentro de uma categoria específica).

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/f63ff761-53ae-49b8-a798-971f38b90392)


### Login
A página de login pode ser acessada via <b>NavBar</b> ou na aba "Administração":

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/48651d22-21b5-4974-9c95-5cad345f5533)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/742961ac-957f-4098-80e9-9abb74184974)


A seguinte tela será exibida:

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/9e967d40-69ff-4175-b717-56e404101b5c)

Ao inserir o user e senha, o sistema irá conferir se aqueles dados estão contidos no Database. 

Em caso de falha, o seguinte aviso será exibido:

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/a404dafd-7b70-4ef7-9b58-cab7c3cbab8b)

Em caso de sucesso, o usuário será redirecionado para a Administração.

### Administração
A administração deve ser totalmente liberada após a realização do Login. Nesta tela, é possível fazer a manipulação dos dados, como ler, editar, excluir e inserir os dados dos itens.

#### Visualizando Produtos (READ):
![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/7c8df800-fddf-4035-89e1-96fb1654d239)

#### Inserindo Produto (CREATE):
Para adicionar um novo registro, basta inserir corretamente todas as informações da guia "Inserção de Itens":

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/aceb3ff3-b595-48af-8cf9-672a9bfc8056)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/adca682d-11c9-4a47-b4d1-3f7ba420ed7e)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/c5680cbd-96e4-4f9e-bbe9-76fe94eeedd5)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/3db71c63-585a-4270-83d0-c9158a3eed5f)

<i>OBS: Note que, como citado anteriormente, a inserção da categoria "Teste" neste item influenciou os elementos que se referem a essa funcionalidade:</i>

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/c3eb9dc9-18fe-4f4c-92a1-567599c73834)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/aecbe37d-d59a-4114-ba59-8f04e996e06c)


#### Editando Registro (UPDATE):
Para editar um item, basta escolher o produto a ser editado e inserir corretamente todas as informações da guia "Atualização de Item":

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/2d791c11-097d-46c5-ae85-c94c9a6d3764)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/9d99481d-0cf3-497c-be58-6281a2e19f4a)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/58909a2e-9715-4e78-8ed0-16b8b989835a)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/206c999b-79ff-4e80-a379-6291714c2b4e)

<i>OBS: A edição de itens também influencia os elementos que se referem a funcionalidade "categorias".</i>

#### Excluindo Registro (DELETE):
Para excluir um item, basta escolher o produto a ser deletado e confirmar sua exclusão:

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/09b97362-9324-41f3-a9e1-33a69da1d5be)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/1dcf322f-60a1-4e2b-8357-bccf04b28ffc)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/91bb1af8-374a-4d05-bed4-91414a478e10)

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/d04ce297-0dfe-45d5-81d4-90b0d0d6a545)

<i>OBS: A exclusão de itens também influencia os elementos que se referem a funcionalidade "categorias".</i>

### Sobre
Esta tela apresenta os desenvolvedores do projeto, com seus nomes, número de identificação na universidade (RGM) e suas respectivas redes. 

![image](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/9bb5c2ba-9cbe-48e3-ba94-a446791ef3eb)

<i>OBS: Esta tela pode ser acessada pelo footer presente em todas as telas ou pela guia <b>"Sobre"</b> na <b>NavBar</b>.</i>

### Funcionamento do projeto 📽

Caso queira obter uma visão mais demonstrativa do projeto, veja os vídeos abaixo! 🎬

https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/4469dd1c-82dd-4f69-a4e1-94de2f775b88

https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/fbe45327-0aa2-4f1e-af18-e5c81a1081eb

[ToyKids_part3.webm](https://github.com/ViihNeris/CatalogoDeBrinquedo-ToyKids/assets/93789218/c2458098-863c-4fad-b136-c682ab908c2c)

<br>

## Obrigada! ✅
Acompanhe mais projetos meus em https://github.com/ViihNeris 😉💜👩🏻‍💻




