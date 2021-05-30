pragma solidity ^0.4.18;


contract LiquidNft {

    constructor() public {

        
            
    }
    
    /* the fundamental business model is as follows - 
    1. An asset has a value by an independent valuation
    2. This is then defined into share Nfts, eg 2 Nfts for 50% shares (this can be extended using Cargo to thousands)
    3. The asset Nfts are not allocated initially
    4. They are then allocated to the company owning the asset
    5. This company manages the asset and produces revenues (eg from a hotel)
    6. The investor pays liquid assets to the company (ie a stablecoin)
    7. The investor then gets Nfts in their account (iNft)
    8. The investor loses liquidity. To free up liquidity a loan is table (CDO in finance terms), this is nftfi
    9. The loan company accepts the valuation produced for the asset and loans stablecoins
    10. The loan is paid to the investor based on the asset holding, and the Nft used then is transferred to a loan account
    11. The loan company does not own the Nft (unless there is a default on the loan repayments), and hence the Nft is only
    held in the account. It is released to the loan company upon default or at the end of the loan to the investor
    12. The company pays dividends to the investor (from profits) and this is then used in part for the loan repayment
    13. Therefore the Nft asset is made more liquid 
    14. If the company fails and the asset is devalued, then the loan company has first call on the actual asset - this is an asset based security
    , so if the company fails then the assets are sold and the money obtained is then paid on a hierarchy with the loan company coming first
    15. Hence the investor takes more risk and get more return from the dividends
    16. This model is then extendable to have multiple loans and multiple investors
    17. Each Nft is valued according to a risk rating, and hence we can pool up Nfts from different underlying assets to create large valued
    18. These large values can then be handled by single high value txns with finance companies. 
    19. Hence this model allows expansion at a granular level and across an entire investor pool making this global and this
    can be applied down to an individual investor using microfinance
    20. By using loans, we allow normal banking also to apply which allows money creation (which fuels growth), therefore
    we have a model which can growth
    
    */
    
    enum InequalityValue {LessThan, GreaterThan}
    
    // investor
    struct  iNft {
        uint nftAmount;
    }

    // loan
    struct  lNft {
        uint nftAmount;
    }

    // company
    struct  cNft {
        uint nftAmount;
    }

   // assets
    struct  Nft {
        uint nftId;
        uint nftAmount;
    }

     // mappings are assetNftId -> accointAddress -> certificateNft (actual ownership of a share)
    
    mapping (uint256 => mapping (address => mapping (uint256 => iNft) ) )  public iNfts;
    
    mapping (uint256 => mapping (address => mapping (uint256 => lNft) ) )  public lNfts;

    mapping (uint256 => mapping (address => mapping (uint256 => cNft) ) )  public cNfts;

 

  //  Nft[] public Nfts;
    
    
        // transfers a nft to a loan account
    function addloanNft( uint256 assetNft, address creditorAddress, uint256 investorNft, uint256 nftValue2) public {
        lNfts[assetNft][creditorAddress][assetNft].nftAmount = nftValue2;
    }

    // transfers an nft to an investor account
    function addiNft( uint256 assetNft, address investorAddress, uint256 investorNft, uint256 nftValue) public {
        iNfts[assetNft][investorAddress][investorNft].nftAmount = nftValue;
    }


  
     // transfers a nft to a loan account
    function addcNft( uint256 assetNft, address companyAddress, uint256 investorNft, uint256 nftValue) public {
        cNfts[assetNft][companyAddress][investorNft].nftAmount = nftValue;
    }
  
  
    
    
  
  
    function () payable public {
    }

}



