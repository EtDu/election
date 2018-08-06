pragma solidity ^0.4.23;


contract Election {
//model candidate
//describe what it looks like
//vote count, id
//store modeled candidate
//fetch it from storage
//track amount in storage 
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    event votedEvent (
        uint indexed _candidateId
    );

    constructor() public {
        addCandidate("Micheal");
        addCandidate("Jason");
    }

    function addCandidate(string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);


    }
    function vote(uint _candidateId) public {
        require(!voters[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++;

        emit votedEvent(_candidateId);


    }


}
