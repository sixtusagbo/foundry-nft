// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToURI() public view {
        string memory expectedURI =
            "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNTAwIiB3aWR0aD0iNTAwIj48dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0iZ3JlZW4iPkhpISBZb3VyIGJyb3dzZXIgaXMgZG9pbmcgYSBncmVhdCBqb2I8L3RleHQ+PC9zdmc+";

        string memory svg =
            '<svg xmlns="http://www.w3.org/2000/svg" height="500" width="500"><text x="0" y="15" fill="green">Hi! Your browser is doing a great job</text></svg>';

        string memory actualURI = deployer.svgToImageURI(svg);

        assert(keccak256(abi.encodePacked(actualURI)) == keccak256(abi.encodePacked(expectedURI)));
    }
}
