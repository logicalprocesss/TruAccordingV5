// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.7.0
pragma solidity ^0.8.27;

import {Account} from "@openzeppelin/contracts/account/Account.sol";
import {ERC1155Holder} from "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import {ERC721Holder} from "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import {EIP712} from "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import {AbstractSigner} from "@openzeppelin/contracts/utils/cryptography/signers/AbstractSigner.sol";
import {SignerP256} from "@openzeppelin/contracts/utils/cryptography/signers/SignerP256.sol";
import {SignerWebAuthn} from "@openzeppelin/contracts/utils/cryptography/signers/SignerWebAuthn.sol";
import {ERC7739} from "@openzeppelin/contracts/utils/cryptography/signers/draft-ERC7739.sol";

/// @custom:security-contact maxxard@proton.me
contract TruAccordingV5 is Account, EIP712, ERC7739, SignerP256, SignerWebAuthn, ERC721Holder, ERC1155Holder {
    constructor(bytes32 qx, bytes32 qy)
        EIP712("TruAccordingV5", "1")
        SignerP256(qx, qy)
    {}

    // The following functions are overrides required by Solidity.

    function _rawSignatureValidation(bytes32 hash, bytes calldata signature)
        internal
        view
        override(SignerWebAuthn, AbstractSigner, SignerP256)
        returns (bool)
    {
        return super._rawSignatureValidation(hash, signature);
    }
}
