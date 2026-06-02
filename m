Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBD28DB54;
	Tue,  2 Jun 2026 03:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371133; cv=none; b=ThxAWAT2bnqm8TqE9IhMvk14WLpOx2VDZ4aBCMDSI+cjRvh+Q8WhcOESTqXkNT9dAldl13LI6dPX+Ge16FeQOq0JauBDiNc5NABapOFDe988lI6I2fOt6usHtnsib7tjlwRf7bXeMz90CARTXMJICL5nWCZuZ3DGBWfbBypnzb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371133; c=relaxed/simple;
	bh=tKakRNq51W34Gg5h6JB5IM6VvifPCm8Gl5djBSlAG2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hqScfeQlkWBNg+ImP+7/vj6msWuAE/cpEFa7EzKi4bHEWNBDdkpx26/LEinrt7rh5fBmmQbXgRmYjJqQDCHXaF7CnJ52GabV4Pt0q1BHvIlzEVRzjQEZBPCviDGVAI0P4vBFTZHgr5C4i0cKvaQSWRM/el+PsP7sPYqHr+M2owg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7mZFsEC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7mZFsEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479711F00893;
	Tue,  2 Jun 2026 03:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780371132;
	bh=c+ipmo611j6ixIGPOU0mO6nZkeCcOGGx4f6G63fcnWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7mZFsECAnx094DeTF/4EOiFmW5M0LENYL7p+hvyTksaocUnfvIfb1v8aaFYYJQOf
	 1gkBZqSghNNttJJBDC853wrwXRFake+Af69t35KF91l2wER2BfrfBxMXM7ixEc4sp1
	 p+u4UF2nmAUpKA1Fl3+kAY2DnQVpFqrJaHJBDQYOStYSLSjuwK5LWIOJpE4xKT0VOC
	 uYMSv6/ADEWxgZ1aG1VwE5p4RVplQ211x9iI5CUzBqcnYDA+XzqTwIq5E4lAdUkYCM
	 SZSwknPmcToIRIYDjsPHIGzfV5TixJD+9SndzYA7HMvMvkwzyRzTU9jHzqIGAAAQGB
	 Xy2eo2OCwPbbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: "Alex Gaynor" <alex.gaynor@gmail.com>, "Timur Tabi" <ttabi@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Benno
 Lossin" <lossin@kernel.org>, "David Airlie" <airlied@gmail.com>, "Trevor
 Gross" <tmgross@umich.edu>, =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Boqun Feng" <boqun.feng@gmail.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alistair Popple" <apopple@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Danilo
 Krummrich" <dakr@kernel.org>
In-Reply-To: <20260602032111.224790-14-jhubbard@nvidia.com>
References: <20260602032111.224790-14-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 03:32:10 +0000
Message-Id: <20260602033211.479711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch uses `field: expr` instead of `field <- expr` inside `=
init!`, violating Rust subsystem guidelines and defeating the goal of avoid=
ing stack allocation.
--

commit 7149f8afdf16eef886b0d72d3c2139493024923e
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
   =20
This commit extracts the SHA-384 hash, RSA public key, and RSA signature
from FMC ELF32 firmware sections. The signatures are stored in a
heap-allocated structure used for FSP Chain of Trust verification.

> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index 011be1e571c25..db61905eac9de 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs

[ ... ]

> @@ -41,7 +63,73 @@ pub(crate) fn new(
> =20
>          Ok(Self {
>              fmc_image,
> -            fmc_elf: fw,
> +            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
>          })
>      }
> +
> +    /// Extract FMC firmware signatures for Chain of Trust verification.

[ ... ]

> +        // Initialize the signatures in place to avoid building the larg=
e `FmcSignatures` on the
> +        // stack, then fill each section from the firmware.
> +        let signatures =3D KBox::init(
> +            init!(FmcSignatures {
> +                hash384: [0; _],
> +                public_key: [0; _],
> +                signature: [0; _],
> +            })

[Severity: Medium]
Does this init! block allocate these arrays on the stack before moving them=
=20
to the heap?

According to the Rust subsystem coding guidelines, fields that require in-p=
lace
initialization should use the `field <- expr` syntax rather than `field: ex=
pr`.=20

Because `hash384: [0; _]` and the other fields use the colon syntax, the
arrays (which are up to 384 bytes each) might be evaluated as temporaries on
the stack, which defeats the goal mentioned in the comment above.

Could these be updated to use the in-place initialization syntax, such as=20
`hash384 <- kernel::init::zeroed()` or similar?

> +            .chain(|sigs| {
> +                // PANIC: src and dst lengths are both FSP_HASH_SIZE (ve=
rified above).
> +                sigs.hash384.copy_from_slice(hash_section);
> +                // PANIC: dst is sliced to src.len(); src.len() <=3D FSP=
_PKEY_SIZE per `get_section`.
> +                sigs.public_key[..pkey_section.len()].copy_from_slice(pk=
ey_section);
> +                // PANIC: dst is sliced to src.len(); src.len() <=3D FSP=
_SIG_SIZE per `get_section`.
> +                sigs.signature[..sig_section.len()].copy_from_slice(sig_=
section);
> +                Ok(())
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        Ok(signatures)
> +    }
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602032111.2247=
90-1-jhubbard@nvidia.com?part=3D13
