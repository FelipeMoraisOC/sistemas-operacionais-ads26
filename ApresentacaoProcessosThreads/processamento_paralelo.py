import multiprocessing
import queue # Necessário para tratar exceções da fila
import math
import time
from tqdm import tqdm
import os

def eh_primo(n):
    """Função matemática para verificar se um número é primo."""
    if n < 2:
        return False
    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            return False
    return True

def trabalhador(id_core, fila_tarefas, fila_resultados):
    """
    Cada processo pega lotes pequenos da fila continuamente. 
    Se um processo for mais rápido, ele pegará mais lotes.
    """
    while True:
        try:
            # Tenta pegar um lote da fila. Se estiver vazia, cai no "except"
            inicio, fim = fila_tarefas.get_nowait()
            
            primos_encontrados = []
            for num in range(inicio, fim):
                if eh_primo(num):
                    primos_encontrados.append(num)
            
            # Envia para a fila principal o tamanho do lote processado e os resultados
            fila_resultados.put((fim - inicio, primos_encontrados))
            
        except queue.Empty:
            # A fila esvaziou. Este core concluiu seu turno e pode descansar!
            break

if __name__ == "__main__":
    os.system('clear')
    
    cores_totais = multiprocessing.cpu_count() / 2
    print("==================================================")
    print(" DEMONSTRAÇÃO: BALANCEAMENTO DINÂMICO DE CARGA ")
    print("==================================================")
    print(f"[!] Cores (núcleos) disponíveis no sistema: {cores_totais}\n")

    x = int(input("Até qual valor (X) verificar primos? (Ex: 5000000): "))
    cores_alocados = int(input(f"Quantos cores reais deseja utilizar (1 a {cores_totais})? "))
    total_lotes = int(input(f"Dividir a tarefa em quantos lotes: 0"))
    
    if total_lotes < cores_alocados: tamanho_lote = 80

    print("\nFatiando o trabalho em micro-lotes (Fila de Tarefas)...\n")
    
    tempo_inicio = time.time()

    fila_tarefas = multiprocessing.Queue()
    fila_resultados = multiprocessing.Queue()

    # Criação dos micro-lotes (ex: de 10.000 em 10.000 números)
    tamanho_lote = math.ceil((x + 1) / total_lotes)

    # Preenche a fila centralizada com os lotes
    for i in range(total_lotes):
        inicio = i * tamanho_lote
        fim = min((i + 1) * tamanho_lote, x + 1)
        fila_tarefas.put((inicio, fim))

    # Inicia os processos (trabalhadores)
    processos = []
    for i in range(cores_alocados):
        p = multiprocessing.Process(target=trabalhador, args=(i, fila_tarefas, fila_resultados))
        processos.append(p)
        p.start()

    todos_os_primos = []
    
    # O processo principal exibe uma única barra de progresso unificada
    with tqdm(total=x+1, desc="Progresso Global (Todos os Cores)") as pbar:
        lotes_processados = 0
        while lotes_processados < total_lotes:
            # Puxa os resultados à medida que qualquer core termina um lote
            qtd_avaliada, primos = fila_resultados.get()
            todos_os_primos.extend(primos)
            pbar.update(qtd_avaliada) # Avança a barra visual
            lotes_processados += 1

    # Aguarda o fechamento limpo de todos os processos
    for p in processos:
        p.join()

    tempo_fim = time.time()
    tempo_execucao = tempo_fim - tempo_inicio
    
    # Ordena todos os números, já que os processos entregaram em ordens diferentes
    todos_os_primos.sort()

    print("\n==================================================")
    print("                 RESULTADO FINAL                  ")
    print("==================================================")
    print(f"Total de números primos encontrados (0 a {x:_}): {len(todos_os_primos):_}".replace('_', '.'))
    print(f"Tempo total de execução: {tempo_execucao:.2f} segundos\n")

    # Menu de listagem limpa
    while True:
        opcao = input("Deseja mostrar os números primos encontrados? (1 - Sim / 2 - Não): ")
        if opcao == '1':
            print("\nNúmeros Primos Encontrados:")
            print(todos_os_primos)
            print("\nFim do programa.")
            break
        elif opcao == '2':
            print("\nEncerrando sem listar os números. Fim do programa.")
            break
        else:
            print("Opção inválida! Digite 1 ou 2.")