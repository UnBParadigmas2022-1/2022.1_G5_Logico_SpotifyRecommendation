# SpotifyRecomendation

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 05<br>
**Paradigma**: Logico<br>

## Alunos
|Matrícula | Aluno | Github |
| -- | -- | -- |
| 180041592  |  Denys Rogeres Leles dos Santos | [@andrelucasf](https://github.com/andrelucasf) |
| 180113259  |  Felipe Correia Andrade | [@Percon12](https://github.com/Percon12) |
| 180103580  |  Jonathan Jorge Barbosa Oliveira|  [@Jonathan-Oliveira](https://github.com/Jonathan-Oliveira) |
| 180125885  |  Lucas Melo dos Santos | [@luucas-melo](https://github.com/luucas-melo) |
| 180127535  |  Mateus Brandao Teixeira | [@mateusbrandaot](https://github.com/mateusbrandaot) |
| 180106821  |  Mateus Gomes do Nascimento | [@matgomes21](https://github.com/matgomes21) |
| 180127641  |  Matheus Afonso de Souza | [@Matheusafonsouza](https://github.com/Matheusafonsouza) |
| 180138545  |  Thiago Mesquita Peres Nunes de Carvalho | [@thiagompc](https://github.com/thiagompc) |
| 180132245  |  Vinicius de Sousa Saturnino | [@viniciussaturnino](https://github.com/viniciussaturnino) |

## Sobre 
Com o intuito de ajudar pessoas a escolher uma música, foi criado o SpotifyRecomendation. O SpotifyRecomendation tarata-se de um projeto focado na recomedação de música para usuários baseado em suas preferências. Neste projeto foi utilizado uma [base da dados pública](https://www.kaggle.com/datasets/zaheenhamidani/ultimate-spotify-tracks-db) filtrada com informações sobre música, artista, gênero, polularidade e etc.

## Screenshots
![menu](src/images/menu.jpeg) <br>
![recomendacoes](src/images/recomendacoes.jpeg)

## Instalação 
**Linguagens**: Prolog<br>
**Tecnologias**: SWI-Prolog v8.4.3<br>
**Pré-requisitos** para rodar o SpotifyRecomendation:
- Docker
- SWI-Prolog v8.4.3
**Execução**: Na raiz do projeto execute:
```
docker-compose run generator
```
Após finalizar, execute o comando:
```
swipl -s src/main.pl
```
Dentro do console digite:
```
start.
```

## Uso 
Para utilizar o SpotifyRecomendation é extremamente simples, após rodar o projeto aparecerá um menu com as seguintes opções: <br>
![menu](src/images/menu.jpeg) <br> <br>
Podendo optar por uma recomendação aleatória, geral, por artista, por daçabilidade, por gênero e populariade. <br>
![artista](src/images/artista.jpeg) <br>
![genero](src/images/genero.jpeg) <br> <br>

Após escolher a recomendação desejada, basta clicar no botão "Enter" e uma recomedação será gerada. <br>

![lista_recomendacao](src/images/lista_recomendacao.jpeg) <br>

## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações
Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Fulano  |  Programação dos Fatos da Base de Conhecimento Lógica | Boa |

## Outros 
Quaisquer outras informações sobre o projeto podem ser descritas aqui.
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.

## Fontes
- Fonte da base de dados utilizada https://www.kaggle.com/datasets/zaheenhamidani/ultimate-spotify-tracks-db
