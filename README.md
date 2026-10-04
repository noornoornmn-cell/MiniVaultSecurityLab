MiniVaultSecurityLab

A small Vyper smart contract security lab I built to learn how to find, test, and prevent common smart contract security problems.

The goal is not to build a complicated protocol.

The goal is to understand the security logic behind a smart contract and learn how to prove that the security rules actually work.

What I Built

MiniVault is a simple Vyper contract with:

An owner

A stored value

A vault balance

A deposit function

A withdrawal function

The main security rule I am practicing is:

Authentication + authorization + validation before state mutation.

Before a restricted action changes important contract state, the required security checks should pass first.

Security Concepts I Practiced

1. Access Control

Only the owner should be able to perform restricted actions.

The contract checks:

msg.sender == owner

The important mental model I learned is:

The deployer's address becomes the owner.

I tested that an unauthorized caller is rejected when attempting a restricted operation.

2. State Mutation

The contract should not change important state until the required security checks have passed.

The basic security flow is:

authorization
      ↓
validation
      ↓
state mutation

If a security check fails, the operation should revert instead of leaving the contract in an invalid state.

3. Deposit Testing

I tested normal deposits and verified that the vault balance increases correctly.

Example:

Starting balance = 1000
Deposit = 500
Final balance = 1500

I also tested a zero-value deposit and verified that the balance remains unchanged.

4. uint256 Boundary Testing

I tested the maximum value of a Vyper uint256.

The maximum value is:

2**256 - 1

I first brought the vault balance exactly to that maximum value.

Then I attempted to deposit one more unit.

The operation was rejected and the balance remained at the maximum value.

This taught me an important security-testing lesson:

Test the boundary, then test what happens when we cross it.

Tests

The current test suite covers:

Owner authorization

Unauthorized withdrawal attempts

Normal deposits

Zero-value deposits

uint256 maximum boundary behavior

State remaining unchanged after the failed boundary deposit

The test suite currently passes all four tests.

Run the tests with:

pytest -q

Tech Stack

Python

Vyper

Titanoboa

pytest

Hypothesis

Git

GitHub

Note: Hypothesis is installed as part of the project dependencies and will be used for future property-based/fuzz testing. It is not yet the main testing tool in the current MiniVault test suite.

Project Structure

MiniVaultSecurityLab/
│
├── MiniVault.vy
├── test_vulnerability.py
├── requirements.txt
├── .gitignore
└── README.md

Temporary generated Vyper files are excluded through .gitignore.

How I Built This

I built this project step by step instead of copying a complete smart contract security project.

My learning process is:

Understand
↓
Predict
↓
Write the test
↓
Run the test
↓
Investigate the result
↓
Explain why
↓
Prove the security property

I also use different ways of reading code:

Rubber Duck Reading — explain the code line by line in plain English.

Trace Table Reading — follow the state from beginning to end.

Skeleton Reading — understand the structure before reading every detail.

Diff Reading — focus on what actually changed.

What Comes Next

MiniVault is a launchpad, not the destination.

My larger goal is smart contract security automation with Python and AI.

The next stage is to take the same security-testing approach and apply it to real authorized smart contract code.

The planned workflow is:

MiniVault
    ↓
AI Security + Real Authorized Code
    ↓
Guided Audits
    ↓
Independent Audits
    ↓
Contest Simulations
    ↓
Real Security Contests / Bug Bounties

AI will be used as an assistant, not as the final authority.

The principle is:

AI suggests → Noor investigates → tests prove.

Current Focus

I am learning how to think like a smart contract security researcher:

Find the security property

Identify who controls the input

Understand how the input affects state

Look for missing authorization or validation

Test the security hypothesis

Check the resulting state

Decide whether the issue is actually exploitable

The goal is not just to make tests pass.

The goal is to understand why the contract is secure or insecure.

Author

Noor M. Noor

Learning smart contract security, Python automation, and AI-assisted security testing.