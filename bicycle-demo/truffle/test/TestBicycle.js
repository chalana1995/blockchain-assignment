const Bicycle = artifacts.require('Bicycle');

contract('Bicycle', (accounts) => {
	let bicycle;
	let expectedBicycleId;

	before(async () => {
		bicycle = await Bicycle.deployed();
	});

	describe('buying a bicycle and retrieving account addresses', async () => {
		before('but a bicycle using accounts[0]', async () => {
			await bicycle.buyers(0, { from: accounts[0] });
			expectedBicycle = accounts[0];
		});

		it('can fetch the address of an owner by bicycle id', async () => {
			const buyer = await bicycle.bicycles(0);
			assert.equal(
				buyer,
				expectedBicycle,
				'The owner of the buy a bicycle should be the first account.'
			);
		});

		it('can fetch the collection of all bicycle owners addresses', async () => {
			const buyers = await bicycle.getBuyers();
			assert.equal(
				buyers[0],
				expectedBicycle,
				'The owner of the buy a bicycle should be in the collection.'
			);
		});
	});
});