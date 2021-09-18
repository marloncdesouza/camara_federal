

# pacotes
library(tidyverse)

# lendo dados de votacao
df_votacoes <- read_csv('data/votacoes.csv')

# Lendo dados de orientacoes
df_orientacoes <- read_csv('data/orientacoes.csv')

# Lendo dados de votos nominais
df_votos <- read_csv('data/votos.csv')

# lendo as preposicoes
df_proposicoes <- read_csv('data/proposicoes.csv')

# lendo temas
df_temas <- read_csv('data/temas.csv')


# Matching da base de votacoes com orientacoes
df_orientacoes_votacao <- df_orientacoes %>%
  left_join(df_votacoes %>% select(id,aprovacao),by = c('idVotacao' = 'id'))


# fazendo matching entre proposicao e tema
# df_proposicoes_tema <- df_proposicoes %>%
#   left_join(df_temas %>% select(uriProposicao,tema),by = c('proposicao_uri' = 'uriProposicao')) %>%
#   replace_na(list(tema = 'Sem Tema'))
  
# Filtrando apenas as proposicoes relevantes

df_proposicoes <- df_proposicoes%>%
  filter(proposicao_codTipo %in% c(135,136,139,140,291))

# fazendo matching entre orientacao_votacao e medidas provisorias
df_ori_vot_prop_tema <- df_orientacoes_votacao %>%
  left_join(df_proposicoes %>% select(idVotacao,proposicao_titulo,proposicao_siglaTipo)) %>%
  select(-c(uriVotacao,siglaOrgao,descricao,uriBancada))













