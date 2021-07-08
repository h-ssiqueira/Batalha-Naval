# Batalha Naval

![GitHub Repository Size](https://img.shields.io/github/repo-size/h-ssiqueira/Batalha-Naval?label=Repository%20Size&style=for-the-badge)

![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

![Notepad++](https://img.shields.io/badge/Notepad++-90E59A.svg?style=for-the-badge&logo=notepad%2B%2B&logoColor=black)

## Descrição
Projeto realizado para a disciplina de [Organização de Computadores e Linguagem de Montagem](https://github.com/h-ssiqueira/ProgramsCOLLEGE#OCLM), utilizando o sistema operacional Windows 10, com o editor de texto Notepad++ e o software DOSBox com o auxílio dos programas [Turbo Assembler](/turbos/TASM.EXE), [Turbo Debugger](/turbos/TD.EXE) e [Turbo Linker](/turbos/TLINK.EXE). O [projeto](LOC-Projeto.pdf) consiste na simulação do jogo batalha naval, feito em assembly X86.

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
	TLINK <PROGRAMA>.OBJ
	<PROGRAMA>.EXE
	```
Caso queira jogar diretamente sem a necessidade de compilar ou linkar (sem a necessidade dos arquivos presentes na [pasta turbos](/turbos/)), execute os comandos de acesso ao diretório [bin](/bin/) deste repositório e execute os arquivos `.EXE` para jogar.

**Nota**: para que haja a compilação e o link do programa, o compilador (TASM) e o linker (TLINK) devem estar no mesmo diretório que o programa que será compilado e linkado. Bem como o debugger (TD).

## Como jogar
Inicialmente, é necessário que cada jogador escolha cinco posições nas quais serão posicionadas os respectivos navios (5 escolhas seguidas para cada jogador respectivamente). Após isso, o jogo se inicia com cada jogador escolhendo sua respectiva posição para realizar o tiro.

## Telas do jogo (Versão 2.0):
<p align="center">
<img src="https://github.com/h-ssiqueira/Batalha-Naval/blob/master/imgs/inicio.png" alt="início">
<!--![início](/imgs/inicio.png)-->
</p>
<p align="center">
<img src="https://github.com/h-ssiqueira/Batalha-Naval/blob/master/imgs/tela%20jogo.png" alt="tela jogo">
<!--![tela jogo](/imgs/tela%20jogo.png)-->
</p>
<p align="center">
<img src="https://github.com/h-ssiqueira/Batalha-Naval/blob/master/imgs/vitoria%20jogador.png" alt="vitória jogador">
<!--![vitória jogador](/imgs/vitoria%20jogador.png)-->
</p>
## Telas do jogo (Versão 1.5):
<p align="center">
<img src="https://github.com/h-ssiqueira/Batalha-Naval/blob/master/imgs/titulov1.png" alt="início jogador">
<!--![início](/imgs/titulov1.png)-->
</p>
<p align="center">
<img src="https://github.com/h-ssiqueira/Batalha-Naval/blob/master/imgs/telav1.png" alt="tela">
<!--![tela jogo](/imgs/telav1.png)-->
</p>
<p align="center">
<img src="https://github.com/h-ssiqueira/Batalha-Naval/blob/master/imgs/vitoriav1.png" alt="vitória jogador">
<!--![vitória jogador](/imgs/vitoriav1.png)-->
</p>
## Telas do jogo (Versão 1.0):
<p align="center">
<img src="https://github.com/h-ssiqueira/Batalha-Naval/blob/master/imgs/tela0_5.png" alt="tela">
<!--![tela](/imgs/tela0_5.png)-->
</p>
<p align="center">
<img src="https://github.com/h-ssiqueira/Batalha-Naval/blob/master/imgs/tabuleiro0_5.png" alt="tabuleiro">
<!--![tabuleiro](/imgs/tabuleiro0_5.png)-->
</p>

## Arquivos
### Versões
Nome | Descrição
:---: | :---:
[Batalha Naval 2.0](/src/Version%202_0.asm) | Código fonte da versão final do jogo, com as partes gráficas, porém sem a opção de jogar com o mouse
[Batalha Naval 1.5](/src/Version%201_5.asm) | Código fonte da primeira versão do jogo, com algumas partes gráficas (letras)
[Batalha Naval 1.0](/src/Version%201_0.asm) | Código fonte da primeira versão do jogo, sem gráficos

### Rascunho
Nome | Descrição | Utilidade
:---: | :---: | :---:
[TITLE1](/Rascunho/TITLE1.ASM) | Desenho do tabuleiro utilizado no jogo | útil
[LETRAS](/Rascunho/LETRAS.pdf) | Demonstra como foi realizada a confecção das letras dos títulos do jogo | útil
[funções filtradas](/Rascunho/funções%20filtradas.pdf) | Informações sobre algumas das funções utilizadas | semiútil
[funções](/Rascunho/funções.txt) | Rascunho de algumas linhas de código na tentativa de implementação de cursor | semiútil
[rascunho cursor](/Rascunho/rascunho_cursor.ASM) | Programa rascunho para implementação simples do cursor | semiútil
[cor](/Rascunho/COR.ASM) | Teste para cor de textos | semiútil
[gráfico](/Rascunho/GRAFIC-1.ASM) | Impressão da posição do cursor na tela | útil
[quad](/Rascunho/QUAD.ASM) | Teste de limpar a tela | semiútil
[testbn](/Rascunho/testbn.asm) | Rascunho que não deu certo | inútil
[TESTE](/Rascunho/TESTE.ASM) | Teste de cor de tela | semiútil
[TITLE](/Rascunho/TITLE.ASM) | Rascunho para cursor gráfico | semiútil
[TABULEIRO](/Rascunho/TABULEIRO.ASM) | Arquivo com o rascunho do layout do tabuleiro utilizado no jogo | inútil
