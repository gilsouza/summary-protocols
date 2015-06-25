# summary-protocols
Projeto exemplo para uso do tshark e gnuplot com bash.

### Uso

#### Pré-requisitos

  * Wireshark
  * GnuPlot
  * Linux ou Windows(com BusyBox).

#### Arquivos

  * iterate.sh:
      - Arquivo que irá fazer a iteração nos arquivos presentes no diretório pcap/.
  * diretório pcap:
      - Diretório onde ficarão os pcaps.
      - Eles deverão seguir um padrão ainda não definido. 
      - Poderá ser NOME + NUMERO (ex: lalala1.pcap).
      - Os códigos até agora não levam isso em consideração.
  * protocols_summary.sh:
      - Versão do gráfico em barras por protocolo (usando tshark e gnuplot).
      - Ele é chamado pelo iterate.sh e recebe por argumento o endereço do arquivo.
      - Cria uma pasta graphs/protocols onde será trabalhada.

#### Executando

Para iterar os arquivos .pcap contidos na pasta pcap/

```sh
  $ ./iterate.sh
```

ou

```sh
  $ ./protocols_summary.sh ENDERECO_ARQUIVO_PCAP
```

Para gerar o gráfico do pcap passado por argumento.

### Docs de referência

[Manuais das ferramentas fornecidas pelo WireShark.](https://www.wireshark.org/docs/man-pages) 
Ex: capinfos, tshark, mergecap, editcap e etc.

[Display Filter Reference](https://www.wireshark.org/docs/dfref) - Pacotes e propriedades de todos protocolos (ou quase rs). =)

[Documentação oficial GnuPlot.](http://www.gnuplot.info)

[Tutorial plotagem de gráficos.](http://fiscomp.if.ufrgs.br/index.php/Gnuplot)
