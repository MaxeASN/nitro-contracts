// copyright 2023-2025, MaxeASN, https://github.com/maxeasn
// SPDX-License-Identifier: BSL

// solhint-disable-next-line compiler-version
pragma solidity >=0.6.9 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "./IOwnable.sol";
import "./ISequencerNumber.sol";

contract SequencerNumber is Initializable, ISequencerNumber {

    IOwnable public rollup;

    /// @dev curSeqNum is the current sequence number
    uint256 public curSeqNum;

    /// @dev seqNum2Hash is a map
    /// key: the sequence number
    /// value: the hash of the tx
    mapping(uint256 => bytes32) public seqNum2Hash;

    function initialize(IOwnable rollup_) external initializer {
        rollup = rollup_;
    }

    /// @inheritdoc ISequencerNumber
    function setTxHashWithSeqNum(
        uint256 seqNum,
        bytes32 txHash)
    external
    {
        seqNum2Hash[seqNum] = txHash;
    }

    /// @inheritdoc ISequencerNumber
    function getTxHashWithSeqNum(uint256 seqNum) external view returns (bool _exist, bytes32 _txHash) {
        _txHash = seqNum2Hash[seqNum];
        _exist =  _txHash != bytes32(0);
        return (_exist, _txHash);
    }

}
