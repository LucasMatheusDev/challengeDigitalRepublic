# challenge_digital_republic

## Objetivo do código
Uma aplicação web ou mobile que ajude o usuário a calcular a quantidade de tinta necessária para pintar uma sala.
Essa aplicação deve considerar que a sala é composta de 4 paredes e deve permitir que o usuário escolha qual a medida de cada parede e quantas janelas e portas possuem cada parede.
Com base na quantidade necessária o sistema deve apontar tamanhos de lata de tinta que o usuário deve comprar, sempre priorizando as latas maiores. Ex: se o usuário precisa de 19 litros, ele deve sugerir 1 lata de 18L + 2 latas de 0,5L

## Regras de negócio

Nenhuma parede pode ter menos de 1 metro quadrado nem mais de 15 metros quadrados, mas podem possuir alturas e larguras diferentes

O total de área das portas e janelas deve ser no máximo 50% da área de parede

A altura de paredes com porta deve ser, no mínimo, 30 centímetros maior que a altura da porta

Cada janela possui as medidas: 2,00 x 1,20 mtos

Cada porta possui as medidas: 0,80 x 1,90

Cada litro de tinta é capaz de pintar 5 metros quadrados

Não considerar teto nem piso.

As variações de tamanho das latas de tinta são:

0,5 L
2,5 L
3,6 L
18 L

# Estrutura do prjeto
 ## Projeto feito em Estrutura Modular, Onde cada mudolo representa um bloco do App
 ## Modulo Homa Page 
 
## Temos a View Principal, 
### Onde após informar a quantidade de paredes,
 ### será coletado os da dos informados pelo usuario 
 
 
![Screenshot_1647452105](https://user-images.githubusercontent.com/81427844/158652607-02dc01a9-9685-4799-8d0e-72fb6d59be03.png)
 

## Após informar os valores é feito a verificação de : 
### Valores não vazios
### Verificação de Toda a Regra de Negocio

![controller code](https://user-images.githubusercontent.com/81427844/158648682-e9275919-d60d-4ad2-a02d-3627e5b97ce0.png)


## Apuração do Resultado Final

![result code](https://user-images.githubusercontent.com/81427844/158653238-d73e6d93-4eae-45e7-aadc-d6c30fa7c5c8.png)


### E por fim, Formatação dos resuktados para que seja transformado em algo utilizavel para o Proposito do App 

![Screenshot_1647452115](https://user-images.githubusercontent.com/81427844/158652902-d7a02d9c-fc6a-4458-bca3-2c3399d90ab9.png)





 
