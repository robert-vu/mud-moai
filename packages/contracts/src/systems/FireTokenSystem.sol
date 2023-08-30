// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { System } from "@latticexyz/world/src/System.sol";
import { ERC20Balance } from "../codegen/tables/ERC20Balance.sol";
import { ERC20Allowance } from "../codegen/tables/ERC20Allowance.sol";
//import { ERC721AprovalAllTable } from "../codegen/tables/ERC721AprovalAllTable.sol";
import {
  TABLE_TOKEN_FIRE_ID,
  TABLE_TOKEN_FIRE_ALLOWANCE_ID
} from "../common/Constants.sol";
 
contract FireTokenSystem is System {

    bytes32 _tableId=TABLE_TOKEN_FIRE_ID;
    bytes32 _tableAllowanceId=TABLE_TOKEN_FIRE_ALLOWANCE_ID;
    event Transfer(address from,address to, uint256 amount);
    event Approval(address owner,address spender, uint256 amount);

  function transfer(address recipient, uint amount) external returns (bool) {
        
        ERC20Balance.set(_tableId,_msgSender(), ERC20Balance.get(_tableId,_msgSender()) - amount);
        ERC20Balance.set(_tableId,recipient,amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
    function approve(address spender, uint amount) external returns (bool) {
        ERC20Allowance.set(_tableId,_msgSender(),spender,amount);
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    /* function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {

        ERC20Allowance.set(_tableId,sender,_msgSender(),ERC20Allowance.get(_tableId,sender,_msgSender())-amount);
        //allowance[sender][msg.sender] -= amount;

        ERC20Balance.set(_tableId,sender,ERC20Balance.get(_tableId,sender)-amount);
        //balanceOf[sender] -= amount;
        ERC20Balance.set(_tableId,recipient,ERC20Balance.get(_tableId,recipient)+amount);
        //balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    } */
    function mint(uint amount) external {
        //balanceOf[msg.sender] += amount;
        ERC20Balance.set(_tableId,_msgSender(),ERC20Balance.get(_tableId,_msgSender())+amount);
        //totalSupply += amount;
        emit Transfer(address(0), _msgSender(), amount);
    }

    function burn(uint amount) external {
        //balanceOf[msg.sender] -= amount;
        ERC20Balance.set(_tableId,_msgSender(),ERC20Balance.get(_tableId,_msgSender())-amount);
        //totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
  

}