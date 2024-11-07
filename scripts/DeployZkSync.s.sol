// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;
import {ZkSyncScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';
import {CLRatePriceCapAdapter} from '../src/contracts/CLRatePriceCapAdapter.sol';
import {AaveV3ZkSync } from 'aave-address-book/AaveV3ZkSync.sol';
import {IPriceCapAdapter, IChainlinkAggregator} from '../src/interfaces/IPriceCapAdapter.sol';

library CapAdaptersCodeZkSync {
  address public constant sUSDe_USDe_AGGREGATOR = 0x97920183c36B022B46D6C14b9dA36c5f31A98C6A;
  address public constant USDe_PRICE_FEED = 0x4899faF0b6c36620168D00e3DbD4CB9361244c4d;

  function sUSDeAdapterParams() internal pure returns (bytes memory) {
    return
      abi.encode(
        IPriceCapAdapter.CapAdapterParams({
          aclManager: AaveV3ZkSync.ACL_MANAGER,
          baseAggregatorAddress: USDe_PRICE_FEED,
          ratioProviderAddress: sUSDe_USDe_AGGREGATOR,
          pairDescription: 'Capped sUSDe / USDe / USD',
          minimumSnapshotDelay: 14 days,
          priceCapParams: IPriceCapAdapter.PriceCapUpdateParams({
            snapshotRatio: 1_108087487354065863,
            snapshotTimestamp: 1729101653, // 16th of October 2024
            maxYearlyRatioGrowthPercent: 50_00
          })
        })
      );
  }


}

contract DeploySUSDeZkSync is ZkSyncScript {
  function run() external broadcast {
    new CLRatePriceCapAdapter{salt: 'capo'}(
      abi.decode(CapAdaptersCodeZkSync.sUSDeAdapterParams(), (IPriceCapAdapter.CapAdapterParams))
    );
  }
}
