// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface IFireTokenSystem {
  function transfer(address recipient, uint amount) external returns (bool);

  function approve(address spender, uint amount) external returns (bool);

  function mint(uint amount) external;

  function burn(uint amount) external;
}
