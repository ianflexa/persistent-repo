how to reproduce: 

```script
forge install
```

```
forge test --zksync --mc sUSDePriceCapAdapterZkSyncTest --mt test_latestAnswerRetrospective -vvvv
```

traces:
```
Compiling 93 files with Solc 0.8.19
Solc 0.8.19 finished in 1.75s
Compiler run successful!

Compiling 93 files with zksolc and ZKsync solc 0.8.19
zksolc and ZKsync solc 0.8.19 finished in 10.76s
Compiler run successful!

Ran 1 test for test/zksync/sUSDePriceCapAdapterZkSyncTest.t.sol:sUSDePriceCapAdapterZkSyncTest
[FAIL: EvmError: Revert] test_latestAnswerRetrospective() (gas: 4189205)
Traces:
  [9023] sUSDePriceCapAdapterZkSyncTest::setUp()
    ├─ [0] VM::rpcUrl("zksync") [staticcall]
    │   └─ ← [Return] <rpc url>
    ├─ [0] VM::createSelectFork("<rpc url>", 47910214 [4.791e7])
    │   └─ ← [Return] 0
    └─ ← [Stop] 

  [4189205] sUSDePriceCapAdapterZkSyncTest::test_latestAnswerRetrospective()
    ├─ [0] VM::rpcUrl("zksync") [staticcall]
    │   └─ ← [Return] <rpc url>
    ├─ [0] VM::createSelectFork("<rpc url>", 47908014 [4.79e7])
    │   └─ ← [Return] 1
    ├─ [1805112] → new CLRatePriceCapAdapter@0x6DE861B1e6139d9C18906CC1B7274C0aF0F15b19
    │   ├─ [24873] 0x97920183c36B022B46D6C14b9dA36c5f31A98C6A::decimals()
    │   │   ├─ [8001] 0x5AD89e6a07F0ad2f2A0e3636072A00aEAB4e8624::decimals()
    │   │   │   └─ ← [Return] 18
    │   │   └─ ← [Return] 18
    │   ├─ [15401] 0x4899faF0b6c36620168D00e3DbD4CB9361244c4d::decimals()
    │   │   ├─ [7757] 0xBC7d402c12C362a48Bf4BCB52F8db6327d8998a8::decimals()
    │   │   │   └─ ← [Return] 8
    │   │   └─ ← [Return] 8
    │   └─ ← [Return] 17120 bytes of code
    ├─ [137187] CLRatePriceCapAdapter::getRatio() [staticcall]
    │   └─ ← [Return] 1112982843012929002 [1.112e18]
    ├─ [0] VM::rpcUrl("zksync") [staticcall]
    │   └─ ← [Return] <rpc url>
    ├─ [0] VM::createSelectFork("<rpc url>", 47909414 [4.79e7])
    │   └─ ← [Return] 2
    ├─ [1805409] → new CLRatePriceCapAdapter@0xE93CD6597308Dcd1Cd626757994746bD04181160
    │   ├─ [24873] 0x97920183c36B022B46D6C14b9dA36c5f31A98C6A::decimals()
    │   │   ├─ [8001] 0x5AD89e6a07F0ad2f2A0e3636072A00aEAB4e8624::decimals()
    │   │   │   └─ ← [Return] 18
    │   │   └─ ← [Return] 18
    │   ├─ [15401] 0x4899faF0b6c36620168D00e3DbD4CB9361244c4d::decimals()
    │   │   ├─ [7757] 0xBC7d402c12C362a48Bf4BCB52F8db6327d8998a8::decimals()
    │   │   │   └─ ← [Return] 8
    │   │   └─ ← [Return] 8
    │   └─ ← [Return] 17120 bytes of code
    ├─ [108815] CLRatePriceCapAdapter::MINIMUM_SNAPSHOT_DELAY() [staticcall]
    │   └─ ← [Return] 1209600 [1.209e6]
    ├─ [0] VM::makePersistent(CLRatePriceCapAdapter: [0xE93CD6597308Dcd1Cd626757994746bD04181160])
    │   └─ ← [Return] 
    ├─ [0] VM::rpcUrl("zksync") [staticcall]
    │   └─ ← [Return] <rpc url>
    ├─ [0] VM::createSelectFork("<rpc url>", 47909414 [4.79e7])
    │   └─ ← [Return] 3
    ├─ [108815] CLRatePriceCapAdapter::BASE_TO_USD_AGGREGATOR() [staticcall]
    │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    ├─ [102256] 0x0000000000000000000000000000000000000000::latestAnswer() [staticcall]
    │   └─ ← [Return] 
    └─ ← [Revert] EvmError: Revert

Suite result: FAILED. 0 passed; 1 failed; 0 skipped; finished in 3.85s (3.05s CPU time)

Ran 1 test suite in 4.94s (3.85s CPU time): 0 tests passed, 1 failed, 0 skipped (1 total tests)

Failing tests:
Encountered 1 failing test in test/zksync/sUSDePriceCapAdapterZkSyncTest.t.sol:sUSDePriceCapAdapterZkSyncTest
[FAIL: EvmError: Revert] test_latestAnswerRetrospective() (gas: 4189205)

Encountered a total of 1 failing tests, 0 tests succeeded


```