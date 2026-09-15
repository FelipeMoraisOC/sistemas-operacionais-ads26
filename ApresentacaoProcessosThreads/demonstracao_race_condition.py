import threading
import random
import time
import os

X = 0
ALVO = 1000000 # Reduzido para 100 mil para a apresentação não demorar na tela

def adicionar_sem_mutex():
    """Adiciona +1 à variável sem proteção, forçando a interrupção."""
    global X
    for _ in range(ALVO):
        valor_atual = X
        
        # O sleep(0) força o Sistema Operacional a pausar esta thread AGORA
        # e dar a vez para a outra thread, enquanto esta segura um valor desatualizado!
        if random.random() < 0.05: 
            time.sleep(0)
        X = valor_atual + 1

def adicionar_com_mutex(trava):
    """Adiciona +1 à variável COM a proteção do Mutex."""
    global X
    for _ in range(ALVO):
        with trava: # A trava fecha a porta
            valor_atual = X
            
            # Mesmo que o SO pause a thread aqui dentro, a outra thread 
            # não consegue invadir porque a porta (Mutex) está trancada!
            time.sleep(0) 
            
            X = valor_atual + 1

if __name__ == "__main__":
    os.system('clear')
    print("==================================================")
    print("   DEMONSTRAÇÃO: RACE CONDITION VS MULTITHREADING ")
    print("==================================================")
    print("O que deseja executar?")
    print("1 - Condição de Corrida (Sem Mutex)")
    print("2 - Multithreading Seguro (Com Mutex)")
    
    opcao = input("\nEscolha uma opção (1 ou 2): ")

    X = 0
    trava_mutex = threading.Lock()

    if opcao == '1':
        print(f"\n[!] Iniciando 2 Threads SEM Mutex (Alvo: {ALVO * 2:_})...".replace('_', '.'))
        alvo = adicionar_sem_mutex
        args = ()
    elif opcao == '2':
        print(f"\n[!] Iniciando 2 Threads COM Mutex (Alvo: {ALVO * 2:_})...".replace('_', '.'))
        alvo = adicionar_com_mutex
        args = (trava_mutex,)
    else:
        print("Opção inválida.")
        exit()

    thread1 = threading.Thread(target=alvo, args=args)
    thread2 = threading.Thread(target=alvo, args=args)

    tempo_inicio = time.time()

    thread1.start()
    thread2.start()

    thread1.join()
    thread2.join()

    tempo_fim = time.time()
    tempo_execucao = tempo_fim - tempo_inicio

    print("==================================================")
    print(f"VALOR FINAL DE X: {X:_}".replace('_', '.'))
    print(f"TEMPO DE EXECUÇÃO: {tempo_execucao:.4f} segundos")
    print("==================================================")