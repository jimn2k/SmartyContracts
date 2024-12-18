// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

/// @title Research Paper
/// @author Sam Stutler
/// @notice An abstract contract used to represent a research paper within the framework
/// @dev Details subject to change, hence the initializer, indicating this contract should be deployed through an upgradeable contract
abstract contract ResearchPaper{

    mapping (address => address[]) contributions;
    mapping (uint => address) contributionNetScore;
    mapping (address => string) citationLinks;


    event authorAdded(address);
    event authorRemoved(address);
    event paperCertified(address);
    event paperRetracted(address);
    event citationAdded();
    event citationRemoved();

    ///@notice Title of the paper
    string public title;
    ///@notice Authors by address for funding
    address[] public authors;
    ///@notice Contents thereof, as an array due to the collaborative nature of papers
    ///@dev This includes codepoints for LaTeX
    string[] public body;
    ///@notice Digital Object Identifier for off/cross-chain citation
    bytes public doi;
    string[] public citations;


    function initialize(
        string memory ptitle,
        address[] memory pauthors,
        string[] memory pbody,
        string[] memory pcitations
    ) public {
        title = ptitle;
        authors = pauthors;
        body = pbody;
        citations = pcitations;
    }

}