// SPDX-License-Identifier: ISC
pragma solidity ^0.8.20;

interface Aave {
    struct InvestmentProduct {
        bool exists;
        string name;
        bool withdrawable;
        uint256 minAmount;
        uint256 maxAmount;
        bool pointsRequired;
        bool packagesSupported;
        uint256 productFeePercent;
        bool active;
    }

    struct Package {
        uint256 cost;
        uint256 code;
        uint256 count;
        uint256 lpBasis;
        bool active;
    }

    function withdrawCapital() external;

    function getInvestmentBalance(
        address investor,
        uint256 productId
    ) external view returns (uint256);

    function getInvestmentBalances(
        address investor
    ) external view returns (uint256[] memory result);

    function getWithdrawnAmount(
        address investor,
        uint256 productId
    ) external view returns (uint256);

    function getPackagesCount(
        uint256 productId
    ) external view returns (uint256);

    function getPackageStock(
        uint256 productId,
        uint256 packageId
    ) external view returns (uint256);

    function getPoints(address investor) external view returns (uint256);

    function getLPTokenBalance(address user) external view returns (uint256);

    function getLPTokenValue(address user) external view returns (uint256);

    function getInvestmentTypesCount() external view returns (uint256);

    function getActiveInvestmentTypes()
        external
        view
        returns (uint256[] memory activeTypes);

    function getTotalWithdrawn(
        address investor
    ) external view returns (uint256);

    function getRemainingWithdrawableAmount(
        address investor,
        uint256 maxWithdrawalAmount
    ) external view returns (uint256);

    function getPackageDetails(
        uint256 productId,
        uint256 packageId
    ) external view returns (Package memory);

    function getProductDetails(
        uint256 productId
    ) external view returns (InvestmentProduct memory);
}
