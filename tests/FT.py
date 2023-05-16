import pytest
from brownie import Token, accounts, reverts


@pytest.fixture
def contract(scope="module"):
    return Token.deploy("Token", "TST", {"from": accounts[0]})

def test_mint(contract):
    contract.mint(1000, {"from": accounts[0]})
    assert contract.balanceOf(accounts[0]) == 1000 

def test_mint_fail_revert(contract):
    with reverts():
        contract.mint(1000*10**18 + 1, {"from": accounts[0]})

def test_mint_supply_limit(contract):
    with reverts():
        contract.mint(500*10**18 + 1, {"from": accounts[0]}) 
        contract.mint(500*10**18, {"from": accounts[1]}) 