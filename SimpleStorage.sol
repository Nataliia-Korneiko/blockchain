// SPDX-License-Identifier: MIT

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;
pragma solidity ^0.8.8;

// contract SimpleStorage {
// 	bool hasFavoriteNumber = true;
// 	uint256 favoriteNumber = 5;
// 	string favoriteNumberInText = 'Five';
// 	int256 favoriteInt = -5;
// 	address myAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;
// 	bytes32 favoriteBytes = 'cat';
// }

contract SimpleStorage {
	uint256 favoriteNumber; // 0 by default

	// People public person1 = People({ favoriteNumber: 20, name: 'Alex' });
	// People public person2 = People({ favoriteNumber: 4, name: 'RJ' });
	// People public person3 = People({ favoriteNumber: 45, name: 'Matt' });

	struct People {
		uint256 favoriteNumber;
		string name;
	}

	// uint256[] public favoriteNumbersList;
	People[] public people; // array

	mapping(string => uint256) public nameToFavoriteNumber;

	function store(uint256 _favoriteNumber) public {
		favoriteNumber = _favoriteNumber;
		// favoriteNumber = favoriteNumber + 1;
		// uint256 testVar = 5;
	}

	// error because of scope
	// function something() public {
	// 	testVar = 6;
	// }

	// view, pure
	function retrieve() public view returns (uint256) {
		return favoriteNumber;
	}

	function add() public pure returns (uint256) {
		return (1 + 1);
	}

	// calldata, memory, storage
	// function addPerson(string memory _name, uint256 _favoriteNumber) public {
	//   People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
	//   people.push(newPerson);
	// }

	function addPerson(string memory _name, uint256 _favoriteNumber) public {
		people.push(People(_favoriteNumber, _name));
		nameToFavoriteNumber[_name] = _favoriteNumber;
	}
}
