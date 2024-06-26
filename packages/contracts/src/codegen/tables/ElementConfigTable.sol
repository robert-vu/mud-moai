// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

// Import user types
import { ElementType } from "./../Types.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("ElementConfigTab")));
bytes32 constant ElementConfigTableTableId = _tableId;

struct ElementConfigTableData {
  uint256 mintRate;
  uint16 maxSupply;
  uint16 maxFire;
  uint16 maxEarth;
  uint16 maxAir;
  uint16 maxWater;
  uint16 maxLight;
}

library ElementConfigTable {
  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.UINT8;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](7);
    _schema[0] = SchemaType.UINT256;
    _schema[1] = SchemaType.UINT16;
    _schema[2] = SchemaType.UINT16;
    _schema[3] = SchemaType.UINT16;
    _schema[4] = SchemaType.UINT16;
    _schema[5] = SchemaType.UINT16;
    _schema[6] = SchemaType.UINT16;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "name";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](7);
    fieldNames[0] = "mintRate";
    fieldNames[1] = "maxSupply";
    fieldNames[2] = "maxFire";
    fieldNames[3] = "maxEarth";
    fieldNames[4] = "maxAir";
    fieldNames[5] = "maxWater";
    fieldNames[6] = "maxLight";
  }

  /** Register the table's key schema, value schema, key names and value names */
  function register() internal {
    StoreSwitch.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table's key schema, value schema, key names and value names (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get mintRate */
  function getMintRate(ElementType name) internal view returns (uint256 mintRate) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get mintRate (using the specified store) */
  function getMintRate(IStore _store, ElementType name) internal view returns (uint256 mintRate) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set mintRate */
  function setMintRate(ElementType name, uint256 mintRate) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((mintRate)), getValueSchema());
  }

  /** Set mintRate (using the specified store) */
  function setMintRate(IStore _store, ElementType name, uint256 mintRate) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((mintRate)), getValueSchema());
  }

  /** Get maxSupply */
  function getMaxSupply(ElementType name) internal view returns (uint16 maxSupply) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get maxSupply (using the specified store) */
  function getMaxSupply(IStore _store, ElementType name) internal view returns (uint16 maxSupply) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set maxSupply */
  function setMaxSupply(ElementType name, uint16 maxSupply) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((maxSupply)), getValueSchema());
  }

  /** Set maxSupply (using the specified store) */
  function setMaxSupply(IStore _store, ElementType name, uint16 maxSupply) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((maxSupply)), getValueSchema());
  }

  /** Get maxFire */
  function getMaxFire(ElementType name) internal view returns (uint16 maxFire) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get maxFire (using the specified store) */
  function getMaxFire(IStore _store, ElementType name) internal view returns (uint16 maxFire) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set maxFire */
  function setMaxFire(ElementType name, uint16 maxFire) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((maxFire)), getValueSchema());
  }

  /** Set maxFire (using the specified store) */
  function setMaxFire(IStore _store, ElementType name, uint16 maxFire) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((maxFire)), getValueSchema());
  }

  /** Get maxEarth */
  function getMaxEarth(ElementType name) internal view returns (uint16 maxEarth) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get maxEarth (using the specified store) */
  function getMaxEarth(IStore _store, ElementType name) internal view returns (uint16 maxEarth) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set maxEarth */
  function setMaxEarth(ElementType name, uint16 maxEarth) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((maxEarth)), getValueSchema());
  }

  /** Set maxEarth (using the specified store) */
  function setMaxEarth(IStore _store, ElementType name, uint16 maxEarth) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((maxEarth)), getValueSchema());
  }

  /** Get maxAir */
  function getMaxAir(ElementType name) internal view returns (uint16 maxAir) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get maxAir (using the specified store) */
  function getMaxAir(IStore _store, ElementType name) internal view returns (uint16 maxAir) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set maxAir */
  function setMaxAir(ElementType name, uint16 maxAir) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.setField(_tableId, _keyTuple, 4, abi.encodePacked((maxAir)), getValueSchema());
  }

  /** Set maxAir (using the specified store) */
  function setMaxAir(IStore _store, ElementType name, uint16 maxAir) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.setField(_tableId, _keyTuple, 4, abi.encodePacked((maxAir)), getValueSchema());
  }

  /** Get maxWater */
  function getMaxWater(ElementType name) internal view returns (uint16 maxWater) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 5, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get maxWater (using the specified store) */
  function getMaxWater(IStore _store, ElementType name) internal view returns (uint16 maxWater) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 5, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set maxWater */
  function setMaxWater(ElementType name, uint16 maxWater) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.setField(_tableId, _keyTuple, 5, abi.encodePacked((maxWater)), getValueSchema());
  }

  /** Set maxWater (using the specified store) */
  function setMaxWater(IStore _store, ElementType name, uint16 maxWater) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.setField(_tableId, _keyTuple, 5, abi.encodePacked((maxWater)), getValueSchema());
  }

  /** Get maxLight */
  function getMaxLight(ElementType name) internal view returns (uint16 maxLight) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 6, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get maxLight (using the specified store) */
  function getMaxLight(IStore _store, ElementType name) internal view returns (uint16 maxLight) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 6, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set maxLight */
  function setMaxLight(ElementType name, uint16 maxLight) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.setField(_tableId, _keyTuple, 6, abi.encodePacked((maxLight)), getValueSchema());
  }

  /** Set maxLight (using the specified store) */
  function setMaxLight(IStore _store, ElementType name, uint16 maxLight) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.setField(_tableId, _keyTuple, 6, abi.encodePacked((maxLight)), getValueSchema());
  }

  /** Get the full data */
  function get(ElementType name) internal view returns (ElementConfigTableData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getValueSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, ElementType name) internal view returns (ElementConfigTableData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getValueSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    ElementType name,
    uint256 mintRate,
    uint16 maxSupply,
    uint16 maxFire,
    uint16 maxEarth,
    uint16 maxAir,
    uint16 maxWater,
    uint16 maxLight
  ) internal {
    bytes memory _data = encode(mintRate, maxSupply, maxFire, maxEarth, maxAir, maxWater, maxLight);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getValueSchema());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    ElementType name,
    uint256 mintRate,
    uint16 maxSupply,
    uint16 maxFire,
    uint16 maxEarth,
    uint16 maxAir,
    uint16 maxWater,
    uint16 maxLight
  ) internal {
    bytes memory _data = encode(mintRate, maxSupply, maxFire, maxEarth, maxAir, maxWater, maxLight);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.setRecord(_tableId, _keyTuple, _data, getValueSchema());
  }

  /** Set the full data using the data struct */
  function set(ElementType name, ElementConfigTableData memory _table) internal {
    set(
      name,
      _table.mintRate,
      _table.maxSupply,
      _table.maxFire,
      _table.maxEarth,
      _table.maxAir,
      _table.maxWater,
      _table.maxLight
    );
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, ElementType name, ElementConfigTableData memory _table) internal {
    set(
      _store,
      name,
      _table.mintRate,
      _table.maxSupply,
      _table.maxFire,
      _table.maxEarth,
      _table.maxAir,
      _table.maxWater,
      _table.maxLight
    );
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (ElementConfigTableData memory _table) {
    _table.mintRate = (uint256(Bytes.slice32(_blob, 0)));

    _table.maxSupply = (uint16(Bytes.slice2(_blob, 32)));

    _table.maxFire = (uint16(Bytes.slice2(_blob, 34)));

    _table.maxEarth = (uint16(Bytes.slice2(_blob, 36)));

    _table.maxAir = (uint16(Bytes.slice2(_blob, 38)));

    _table.maxWater = (uint16(Bytes.slice2(_blob, 40)));

    _table.maxLight = (uint16(Bytes.slice2(_blob, 42)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    uint256 mintRate,
    uint16 maxSupply,
    uint16 maxFire,
    uint16 maxEarth,
    uint16 maxAir,
    uint16 maxWater,
    uint16 maxLight
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(mintRate, maxSupply, maxFire, maxEarth, maxAir, maxWater, maxLight);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(ElementType name) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(ElementType name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, ElementType name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint8(name)));

    _store.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }
}
