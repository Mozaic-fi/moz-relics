// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "./interfaces/IRewarder.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract RewarderMock is IRewarder {
    using SafeERC20 for IERC20;
    uint256 private immutable rewardMultiplier;
    IERC20 private immutable rewardToken;
    uint256 private constant REWARD_TOKEN_DIVISOR = 1e18;
    address private immutable MASTERCHEF_V2;

    constructor(
        uint256 _rewardMultiplier,
        IERC20 _rewardToken,
        address _MASTERCHEF_V2
    ) {
        rewardMultiplier = _rewardMultiplier;
        rewardToken = _rewardToken;
        MASTERCHEF_V2 = _MASTERCHEF_V2;
    }

    function onOathReward(
        uint256,
        address user,
        address to,
        uint256 sushiAmount,
        uint256
    ) external override onlyMCV2 {
        /*uint256 pendingReward = sushiAmount.mul(rewardMultiplier) / REWARD_TOKEN_DIVISOR;
        uint256 rewardBal = rewardToken.balanceOf(address(this));
        if (pendingReward > rewardBal) {
            rewardToken.safeTransfer(to, rewardBal);
        } else {
            rewardToken.safeTransfer(to, pendingReward);
        }*/
    }

    function pendingTokens(
        uint256 pid,
        address user,
        uint256 sushiAmount
    ) external view override returns (IERC20[] memory rewardTokens, uint256[] memory rewardAmounts) {
        /*IERC20[] memory _rewardTokens = new IERC20[](1);
        _rewardTokens[0] = (rewardToken);
        uint256[] memory _rewardAmounts = new uint256[](1);
        _rewardAmounts[0] = sushiAmount.mul(rewardMultiplier) / REWARD_TOKEN_DIVISOR;
        return (_rewardTokens, _rewardAmounts);
        */
    }

    modifier onlyMCV2() {
        require(msg.sender == MASTERCHEF_V2, "Only MCV2 can call this function.");
        _;
    }
}
