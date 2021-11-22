let ethers = require('ethers')

const main = async () => {
    const FUNC_TOKEN_ADDRESS = '0xEe3cb16e758dF2bE1a95629581cAb9c1CD77BB0D'

    let wallet1 = new ethers.Wallet.fromMnemonic(process.env.MNEMONIC)

    let provider = ethers.getDefaultProvider('rinkeby')

    wallet1 = wallet1.connect(provider)

    let abi = [
        'function faucet() public',
        'function balanceOf(address who) external view returns (uint256)',
        'function transfer(address to, uint256 value) external returns (bool)'
    ]

    let token = new ethers.Contract(FUNC_TOKEN_ADDRESS, abi, wallet1)

    let tx = await token.faucet()
    await tx.wait()

    let amount1 = await token.balanceOf(wallet1.address)
    console.log('Balance #1: ', ethers.utils.formatEther(amount1))

    // tx = await token.transfer(wallet2.address, ethers.utils.parseEther('100'))
    // await tx.wait()

    // amount1 = await token.balanceOf(wallet1.address)
    // amount2 = await token.balanceOf(wallet2.address)
    // console.log('Balance #1: ', ethers.utils.formatEther(amount1))
    // console.log('Balance #2: ', ethers.utils.formatEther(amount2))
}

main()