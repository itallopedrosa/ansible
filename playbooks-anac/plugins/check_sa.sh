#!/bin/bash
###############################################################################
#                                                                             #
# PROGRAMA : check_sa                                                         #
# VERSAO   : 1.0                                                              #
# FUNCAO   : Plugin do Nagios para geracao dos contadores do sysstat          #
# AUTOR    : Christiano Mendonca                                              #
# LICENCA  : GPL 2                                                            #
#                                                                             #
# --------------------------------------------------------------------------- #
#                                                                             #
# HISTORICO:                                                                  #
#                                                                             #
#  VERSAO   DATA         INFO                                   AUTOR         #
#  -------  ------------ --------------                         -------       #
#                                                                             #
#  2.0      29.04.2010 - Busca informacoeses do Sysstat           cmendon     #
#                                                                             #
###############################################################################
PVER="2.0"
PNAME=`basename $0`
DATE=$(date '+%d')
if [ `arch` = "x86_64" ]; then
        LIBEXEC=/usr/lib64/nagios/plugins
else
        LIBEXEC=/usr/lib/nagios/plugins
fi
ajuda()
{
  printf "
  $PNAME  Versao $PVER  (C) 2010 - Central IT Tecnologia em Negocios
  
  Sintaxe: $PNAME <Warning> <Critical>
   
  OPCOES:	 <cpu>          : Contadores de CPU.
	         <procs>        : Processos criados por segundo
	         <context>      : Contextos por segundo
	         <interrupts>   : Interrupcoes por segundo
	         <fila_cpu>     : Processos esperando para serem executados pela CPU
		 <swap_act>     : Atividades de swap 
		 <io>	        : IO de disco
	         -? | -h        : Ajuda
	         -v             : Imprime versao
"
  exit 0
}
if [ ! -e /var/log/sa/sa$DATE ]; then
	echo "Arquivo do SAR na data de hoje nao foi encontrado. Verifique se o arquivo encontra-se no diretorio /var/log/sa"
	echo "Esse script coleta informacoes de rede do programa sysstat. Instale o programa antes de prosseguir."
	exit 2
fi
if [ ! -d "/var/log/sa" ]; then
    echo "O diretorio /var/log/sa nao foi encontrado. Certifique-se que o sysstat esteja instalado antes de prosseguir."	
    exit 2
fi
case "$1" in
        -h | --help)
            ajuda
        ;;
        -v | --version)
        
	    echo
            echo "$PNAME  Versao $PVER  (C) 2012 - Central IT Tecnologia em Negocios"
            echo
            echo "Script distribuido junto do pacote centralit-plugins"
            echo
	    exit 0
        ;;
        	cpu)
		    	
			CPUN=$(cat /proc/cpuinfo | grep processor | wc -l)
			
			CPUN=$(($CPUN + 1))
			
			/usr/bin/sar -P ALL | egrep -vi "M.dia|average" | tail -$CPUN | grep -i all | while read LINE
			do
				echo -n $LINE | awk '{print "CPU_"$2,"User="$3,"Nice="$4,"System="$5,"Iowait="$6,"Steal="$7,"Idle="$8 }'; echo -n $LINE | awk '{print "|" "User="$3";""Nice="$4";""System="$5";""Iowait="$6";""Steal="$7";""Idle="$8";" }'
				
			done; 
			
		;;
		
		procs)
		
			PROCS=$(/usr/bin/sar -w | tail -2 | egrep -i "M.dia|average" | awk '{print $2}')
		
			echo "$PROCS procs/s |procs/s=$PROCS;"
		;;
		
		context)
		
			CONTEXT=$(/usr/bin/sar -w | tail -2 | egrep -i "M.dia|average" | awk '{print $3}')
			
			echo "$CONTEXT cswch/s |cswch/s=$CONTEXT;"
		;;
		
		interrupts)
		
			IRQ=$(/usr/bin/sar -I SUM | tail -2 | egrep -i "M.dia|average" | awk '{print $3}')
		
			
			echo "$IRQ int/s |int/s=$IRQ;"
		
		;;
		
		swap_act)
		
			SWAPIN=$(/usr/bin/sar -W | tail -2 | egrep -i "M.dia|average" | awk '{print $2}')
			SWAPOUT=$(/usr/bin/sar -W | tail -2 | egrep -i "M.dia|average" | awk '{print $3}')
		
		   	echo "pages_swap_in=$SWAPIN pages_swap_out=$SWAPOUT |pages_swap_in=$SWAPIN;pages_swap_out=$SWAPOUT";
		
		;;
		
		fila_cpu)
		
			PROCSW=$(/usr/bin/sar -q | tail -1 | awk '{print $2}')
		
		   	echo "procs_wait=$PROCSW |procs_wait=$PROCSW";
		
		;;		
		
		io)
		
			TOTAL_TRANSFERS=$(/usr/bin/sar -b | tail -2 | egrep -i "M.dia|average" | awk '{print $2}')
			TOTAL_REQ_READ=$(/usr/bin/sar -b | tail -2 | egrep -i "M.dia|average" | awk '{print $3}')
			TOTAL_REQ_WRITE=$(/usr/bin/sar -b | tail -2 | egrep -i "M.dia|average" | awk '{print $4}')
			TOTAL_BLOCK_READ=$(/usr/bin/sar -b | tail -2 | egrep -i "M.dia|average" | awk '{print $5}')
			TOTAL_BLOCK_WRITE=$(/usr/bin/sar -b | tail -2 | egrep -i "M.dia|average" | awk '{print $6}')
			
			echo "total_transfers=$TOTAL_TRANSFERS/sec total_req_read=$TOTAL_REQ_READ/sec total_req_write=$TOTAL_REQ_WRITE/sec blocks_read=$TOTAL_BLOCK_READ/sec blocks_write=$TOTAL_BLOCK_WRITE/sec |total_transfers=$TOTAL_TRANSFERS/sec;req_read=$TOTAL_REQ_READ/sec;req_write=$TOTAL_REQ_WRITE/sec;blocks_read=$TOTAL_BLOCK_READ/sec;blocks_write=$TOTAL_BLOCK_WRITE/sec"
		;;
		
		*)
          ajuda
        
        ;;
esac

