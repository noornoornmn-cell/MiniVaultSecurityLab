
stored_value: public(uint256) #This is the stored value
owner: public(address) #This is the owne
vault_balance: public(uint256)

@deploy
def __init__():
    self.owner = msg.sender
    self.vault_balance = 1000


@external

#This let us set a new rule

def set_value(new_value: uint256): 
    
    assert msg.sender == self.owner
    # we set the stored value to the new value 

    
    self.stored_value = new_value  # save the new value

@external
def deposit(amount: uint256):

    self.vault_balance += amount # Add the deposited amount to the vault_balance
@external
def withdraw(amount: uint256):

    assert msg.sender == self.owner #Only the owner can withdraw funds
    assert amount <= self.vault_balance # Check if the owner has enough vault_balance to withdraw
    self.vault_balance -= amount # Subtract the withdrawn amount from the vault_balance



        



