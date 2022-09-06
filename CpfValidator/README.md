
# Considerações sobre o projeto

1. Arquitetura MVVM

2. Layout desenvolvido de forma programática (View Code)

3. Para esse modelo não tivemos comunicação com o back-end, logo não foi necessário a criação da Camada Model ou Service

4. Extension de String e UITextFieldDelegate para ajuda na criação da mascara e validação do CPF. 

5. ViewModel e ViewController se comunicão através de um protocolo.

6. ViewModel não é implementada diretamente na View Controller e sim injetada através de um método para não criar um forte acoplamento entre as camadas.

