
# Considerações sobre o projeto

1. Arquitetura MVVM

2. Layout desenvolvido de forma programática ( View Code)

3. Para esse modelo não tivemos comunicação com o back-end, logo não foi necessário a criação da Camada Model ou Service

4. Extension de String e UITextFieldDelegate para ajuda na criação da mascara e validação do CPF. 

5. ViewModel e ViewController se comunicão através de um protocol.

6. ViewModel não é implementada diretamente na View Controller e sim injetada através de um método para não criar um forte acoplamento entre as camadas.

Summary

A structure used to describe a portion of a series, such as characters in a string or objects in an array.

# Sobre a criação da mascara para o CPF

Para criação da mascara utilizei um exemplo da internet aonde temos uma extensão de UITextFieldDelegate e seguimos os seguintes passos lógicos:

1. Criação de uma variável chamada appendString como padrão para lógica

2. Criei um Switch que por padrão pega a range location (uma estrutura usada para descrever parte de uma série de elementos como caracteres em uma String ou elementos de um array) com a seguinte lógica: 

A) Caso seja 3 adicione um ponto na posição 4 

B) Caso seja 7 adicione um ponto na posição 8 ( Lembrando que por conta do primeiro ponto adicionado devemos considerar 7

C) Caso seja 11 adicione um hifen na posição 12 ( Lembrando que por conta do primeiro ponto adicionado devemos considerar 11

D) Criamos um operador condicional para garantir que se o usuário digitar menos do que 13 (consideramos 13, pois o array começa a contabilizar do 0) caracteres irá retornar falso, além disso informamos que o range não pode ser maior que 13 caracteres, fazendo assim que esse textfield tenha um limite de digitos.

# Sobre a validação do CPF

Criamos uma extensão da classe StringProtocol com uma variavel computada que nos permite verificar de forma mais genérica se uma String de entrada em um campo de texto é ou não é um cpf valido

a) Uma String é um array de caracteres, logo usamos o método compact para mapear esse array de entrada 

b) Depois nos certificamos que existem 11 números inteiros e usamos o Set para garantir que não temos somente valores repetidos, pois é comum validações passarem dessa forma "222.222.222-22"

c) Segundo a lógica para calculo, devemos pegar os 9 primeiros elementos do array de caracteres que é o nosso CPF para efetuar uma multiplicação do 10 ao 2 de forma decrescente,depois somar tudo e multiplicar por 10 e no final dividir por 11. Se o valor do resto (aquele que vem depois da virgula) for igual ao primeiro digito então o CPF é valido e depois fazemos a mesma lógica para o segundo digito só que considerando o 1 digito, ou seja 10 primeiros números. Para isso usei o prefix informando tanto 9 quanto 10 para que ele pegasse os 9 primeiros e depois os 10 primeiros valores do array e depois de efetuado o calculo pedi para ele comparar se o resultado é igual ao indice 9 e 10 ( Lembrando que o array considera o 0, por isso esses valores)

d) Criamos uma variavel computada chamada Digito Cpf

e) Criamos a variavel digit que irá ter um reduce into, ou seja irá reduzir o valor do array para um e por padrão nossa closure terá dois parametros que são partialResult e sequence.elemento, sendo o partialResult o acumulo das operações de multiplicação e o segundo parametro é o elemento da sequencia, por exemplo: No meu CPF os elementos da sequencia são 4,3,3,3,8,1 e assim por diante. colocamos os parametros como $0 e $1 que nada mais significam que primeiro e segundo parametro.




    
