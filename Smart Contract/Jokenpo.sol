// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; 

// Usando uma versão estável recente >= 0.8.0 para segurança matemática
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Jokenpo is Ownable(msg.sender) {
     
     mapping(address => string) jogadores;
     mapping(address => informacoesJogadas) jogadas;

      struct informacoesJogadas {
        address jogador;
        string posicao; // aqui, encarei posição como qual será a jogada do jogador, ou seja, se ele estará na posição de pedra, papel ou tesoura 
    }

    function adicionarJogadores(address _carteira, string memory _tipoDeJogador) public onlyOwner {
        jogadores[_carteira] = _tipoDeJogador;
    }

    function jogadaJogador(address _jogador, string memory _posicao) public returns(bool) {

        require(_jogador != address(0), "Endereco");
            
            informacoesJogadas memory _jogadaDaVez = informacoesJogadas ({
             jogador: _jogador,                                                    
             posicao: _posicao });

        jogadas[_jogador] = _jogadaDaVez;
        return true;
    }
}
