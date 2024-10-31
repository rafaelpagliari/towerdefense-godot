# Tower Defense Game Template in Godot

Welcome to the Tower Defense Game Template for Godot! This project is designed to jumpstart the development of tower defense games by providing a fully functional base, including demo turrets, maps, and enemies. It also offers an easy-to-extend system, allowing you to add new turrets, maps, and enemies with minimal effort.

![Screenshot](/Assets/preview_stuff/screenshot.png?raw=true "Screenshot")

## Features

- **4 Torres de Demonstração**: Uma variedade de torres com diferentes estatísticas, habilidades e caminhos de upgrade:
  - **Metralhadora**: Torre de disparo rápido com dano moderado.
    - **Lança-chamas**: Torre de alta velocidade com capacidade de perfuração.
      - **Torre de Raio**: Torre lenta, mas poderosa, com ataque de raio de longo alcance.
        - **Torre Explosiva**: Causa alto dano com uma velocidade de ataque lenta.

	- **2 Mapas de Demonstração**: Dois ambientes diferentes para desafiar suas habilidades estratégicas:
	  - **Mapa de Grama**: Um campo de batalha verde e exuberante com dificuldade equilibrada.
	    - **Mapa de Deserto**: Um ambiente mais desafiador com recursos iniciais aumentados.

	    - **Implantação de Torres por Arrastar e Soltar**: Coloque facilmente as torres no mapa arrastando e soltando-as a partir do HUD.

	    - **Aprimoramento e Venda de Torres**: Aprimore torres para melhorar suas estatísticas ou venda-as para recuperar parte do custo.

	    - **Personalização Fácil**:
	      - **Torres**: Defina novas torres com estatísticas, aprimoramentos e visuais personalizados editando o script `Data` em autoload.
	        - **Inimigos**: Adicione novos inimigos com saúde, velocidade e dificuldade únicos.
		  - **Mapas**: Crie novos mapas com rotas e obstáculos personalizáveis para os inimigos.

		  - **HUD e Menu Principal Simples**: Uma interface de usuário simples que inclui um menu principal e um HUD no jogo para gerenciar suas torres e visualizar estatísticas do jogo.

		  ## Como Usar

		  1. **Clone o Repositório**:
		     - Clone este projeto para sua máquina local usando Git.

		     2. **Abra no Godot**:
		        - Abra o projeto no Godot Engine.

			3. **Execute o Jogo**:
			   - Execute a cena principal para iniciar a demonstração e experimentar a configuração padrão.

			   4. **Personalizando o Jogo**:
			      - **Adicionando Novas Torres**: Adicione suas definições de torres no dicionário `turrets` no script `Data`. Você pode duplicar a cena da torre e personalizá-la, certificando-se de editar o caminho da cena nos dados da torre.
			         - **Adicionando Novos Inimigos**: Da mesma forma, adicione seus inimigos no dicionário `enemies`.
				    - **Adicionando Novos Mapas**: Defina novos mapas adicionando-os no dicionário `maps`, e certifique-se de vincular a cena e os recursos apropriados. Duplique qualquer um dos mapas e adicione seu plano de fundo, depois certifique-se de editar o caminho do inimigo em PathFollow2D e os obstáculos das torres em CollisionPolygon2D.

				    ## Estrutura

				    - **Assets**: Contém todos os sprites e texturas para torres, projéteis, inimigos e mapas.
				    - **Scenes**: Contém as cenas para torres, mapas e outros componentes do jogo, juntamente com os scripts.

				    ## Contribuindo

				    Contribuições são bem-vindas! Se tiver ideias para novas torres, mapas ou outros recursos, sinta-se à vontade para fazer um fork no repositório e enviar um pull request.

				    ## Licença

				    Este projeto está licenciado sob a Licença MIT. Veja o arquivo LICENSE para detalhes.

