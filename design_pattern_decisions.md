

1. Fruit.sol
I wanted to make components modular and reusable, drawing on my experience in Object-oriented design. It's also easier to understand and test small components. I used the abstraction of a Fruit to show a product that expires. Because of the difficulty of testing around "now" in solidity due to the lack of Mock objects, I wrote helper methods that took a specific timestamp.

2. Why use Melonfarm? The first version of meloncoin had a constructor without specifying the address to own the intial tokens. When writing unit tests in solidity, it was impossible to make a test that moved the tokens, as the truffle address at index zero controlled the tokens and I didn't know how to get access to that. Therefore, I chose to send in the initial owner, and made a second contract to manage that. Furthermore, since Meloncoin is an expiring token, it will likely be issued over and over. Having a manager keep track of all versions makes things more simple to the end user.

3. Using OpenZeppelin's Pausable.sol is an example of using and external library. This also gives the ability to pause the contract if something bad happens.

4. I implemented the ERC20 interface for the token, which means it's easy to integrate with many other tools such as Metamask and Mist. This makes it easy to send and receive tokens, without me having to reinvent something that already exists.
