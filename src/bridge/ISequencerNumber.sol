// copyright 2023-2025, MaxeASN, https://github.com/maxeasn
// SPDX-License-Identifier: BSL

// solhint-disable-next-line compiler-version
pragma solidity >=0.6.9 <0.9.0;

interface ISequencerNumber {
    event SequencerNumberUpdated(uint256 indexed seq);

    event TxHashWithSequencerNumber(
        uint256 indexed seq,
        bytes32 indexed txHash
    );


    /// @dev add tx hash and sequence number to the map
    function setTxHashWithSeqNum(uint256 seqNum, bytes32 txHash) external;

    /// @dev query tx hash by sequence number
    function getTxHashWithSeqNum(uint256 seqNum) external returns(bool _exist, bytes32 _txHash);

}
