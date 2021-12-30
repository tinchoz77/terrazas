// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "./Edificio.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Constructora {
    using Counters for Counters.Counter;

    struct DatosEdificio {
        address edificio;
        address owner;
    }

    mapping(uint256 => DatosEdificio) private edificioOwner;
    Counters.Counter private _edificioCounter;

    function crearEdificio() public returns(uint256) {
        uint256 edificioId = _edificioCounter.current();
        _edificioCounter.increment();

        Edificio edificio = new Edificio();
        edificioOwner[edificioId] = DatosEdificio(address(edificio), msg.sender);

        return edificioId;
    }

    function mintDepartamento(uint256 nroEdificio, address to) public  {
        // verificar si el que llama es el dueño del edificio
        require(msg.sender == edificioOwner[nroEdificio].owner);

        Edificio edificio = Edificio(address(edificioOwner[nroEdificio].edificio));
        edificio.safeMint(to);
    }

}