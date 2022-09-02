
# Considerações sobre o projeto

1. Arquitetura MVVM

2. Layout desenvolvido de forma programática ( View Code)

3. Para esse modelo não tivemos comunicação com o back-end, logo não foi necessário a criação da Camada Model ou Service

4. Extension de String e UITextFieldDelegate para ajuda na criação da mascara e validação do CPF. 

5. ViewModel e ViewController se comunicão através de um protocol.

6. ViewModel não é implementada diretamente na View Controller e sim injetada através de um método para não criar um forte acoplamento entre as camadas.
7. 


# Sobre a criação da mascara para o CPF

Para criação da mascara utilizei um exemplo da internet aonde temos uma extensão de UITextFieldDelegate e seguimos os seguintes passos lógicos:

1. Criação de uma variável chamada appendString como padrão para lógica
 
2. Criei um Switch que por padrão pega a range location com a seguinte lógica: 

A) Caso seja 3 adicione um ponto na posição 4 

B) Caso seja 7 adicione um ponto na posição 8 ( Lembrando que por conta do primeiro ponto adicionado devemos considerar 7

C) Caso seja 11 adicione um hifenizará na posição 12 ( Lembrando que por conta do primeiro ponto adicionado devemos considerar 11
