
library(tidyverse)

# periodo de analise
intervalo <- 2010:2020


get_votacao <- function(ano){
  read_csv2(paste('http://dadosabertos.camara.leg.br/arquivos/votacoes/csv/votacoes-',ano,'.csv',sep = ''))
}
get_orientacao <- function(ano){
  read_csv2(paste('http://dadosabertos.camara.leg.br/arquivos/votacoesOrientacoes/csv/votacoesOrientacoes-',ano,'.csv',sep = ''))
}
get_votos <- function(ano){
  read_csv2(paste('http://dadosabertos.camara.leg.br/arquivos/votacoesVotos/csv/votacoesVotos-',ano,'.csv',sep = ''))
}
get_propositions <- function(ano){
  read_csv2(paste('http://dadosabertos.camara.leg.br/arquivos/votacoesProposicoes/csv/votacoesProposicoes-',ano,'.csv',sep = ''))
}

get_temas <- function(ano){
  read_csv2(paste('http://dadosabertos.camara.leg.br/arquivos/proposicoesTemas/csv/proposicoesTemas-',ano,'.csv',sep =''))
}


# iterando sobre dados de votacao
votacoes <- intervalo %>%
  map_dfr(get_votacao)

# iterando sobre dados de orientacao
orientacao <- intervalo %>%
  map_dfr(get_orientacao)

# iterando sobre votos nominais
votos <- intervalo %>%
  map_dfr(get_votos)

# iterando sobre proposicoes
proposicoes <- intervalo %>%
  map_dfr(get_propositions)

# iterando sobre temas
temas <- intervalo %>%
  map_dfr(get_temas)

# salvando no disco
write_csv(orientacao,'data/orientacoes.csv')
write_csv(proposicoes,'data/proposicoes.csv')
write_csv(temas,'data/temas.csv')
write_csv(votos,'data/votos.csv')
write_csv(votacoes,'data/votacoes.csv')






