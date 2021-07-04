# Batalha-Naval

![GitHub Repository Size](https://img.shields.io/github/repo-size/h-ssiqueira/Batalha-Naval?label=Repository%20Size&style=for-the-badge)

![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

![Notepad++](https://img.shields.io/badge/Notepad++-90E59A.svg?style=for-the-badge&logo=notepad%2B%2B&logoColor=black)

## Descrição
Projeto realizado para a disciplina de [Organização de Computadores e Linguagem de Montagem](https://github.com/h-ssiqueira/ProgramsCOLLEGE#OCLM), utilizando o sistema operacional Windows 10, com o editor de texto Notepad++ e o software DOSBox com o auxílio dos programas [Turbo Assembler](TASM.EXE), [Turbo Debugger](TD.EXE) e [Turbo Linker](TLINK.EXE). O [projeto](LOC-Projeto.pdf) consiste na simulação do jogo batalha naval, feito em assembly X86.

## Como executar
Para executar o projeto é necessário o software DOSBox com os seguintes comandos:

* Para acessar a o diretório a partir do caminho até o mesmo, utilizando uma letra para representar uma partição:
	```
	MOUNT <LETRA> <CAMINHO DO DIRETÓRIO>
	```
* Para acessar a região do diretório montado a partir do caminho:
	```
	<LETRA>:
	```
* Para compilar, linkar e executar um programa do projeto:
	```
	TASM <PROGRAMA>.ASM
	TLINK <PROGRAMA>.O
	<PROGRAMA>.EXE
	```

Nota: para que haja a compilação e o link do programa, o compilador (TASM) e o linker (TLINK) devem estar no mesmo diretório que o programa que será compilado e linkado. Bem como o debugger (TD).

## Como jogar
Inicialmente, é necessário que cada jogador escolha cinco posições nas quais serão posicionadas os respectivos navios (5 escolhas seguidas para cada jogador respectivamente). Após isso, o jogo se inicia com cada jogador escolhendo sua respectiva posição para realizar o tiro.

## Arquivos

[Batalha Naval 2.0](Batalha%20Naval%202.0.asm) -> Código fonte da versão final do jogo, com as partes gráficas, porém sem a opção de jogar com o mouse.

[Batalha Naval 1.0](Batalha%20Naval%201.0.asm) -> Código fonte da primeira versão do jogo, sem partes gráficas.

[TABULEIRO](TABULEIRO.ASM) -> Arquivo com somente o layout do tabuleiro utilizado no jogo.

[LETRAS](LETRAS.docx) -> Demonstra como foi realizada a confecção das letras dos títulos do jogo.

[funções filtradas](funções%20filtradas.docx) -> Informaões sobre algumas das funções utilizadas.

 ## Telas do jogo:

![início](inicio.png)

![tela jogo](tela%20jogo.png)

![vitória jogador](vitoria%20jogador.png)
