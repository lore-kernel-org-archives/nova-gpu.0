Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B408C33A9FE;
	Thu, 13 Aug 2026 22:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659977; cv=none; b=ZM7cvG7PrLt0u40C4iBGu6ol7YydXMPKQtMibN1w22s7+VQxtmGTsAEPeBlWlpS/Odt/+ZfnjwFr8X12rtyBzZpll5E5SCuCNufH5W2pRpnncwsc3hehqeEBUjrt+Au6umjK5gv66AQRQmtlxITqTcUDXXxJOPR+xo7nwqcBxpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659977; c=relaxed/simple;
	bh=H7cLLGeIuEQEuQb3FwhTyxKJFyL7geJ4e/G2z2IJ/vo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=kGbnYHlbNg3HiuheIpD/XlkkXbpYlj3NGOZHHE/OvlWDp1IWcajlzJ+FgWLUlFMHC3dyFzgCNUBXJ4/pSTz51vpPtYGz35SIGgaZjF/TKr0/Pbdl53ERZT25DwuRUHOV8fv4isJvm5Si8PjpdGSrxaVAU7lhziZuWaEAdbm57XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MC7uP0+A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MC7uP0+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C191F000E9;
	Thu, 13 Aug 2026 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786659976;
	bh=mOiFUBhCncAxLtDk/O0MYTpNBRhrOwqg4dgh4qfSEfo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=MC7uP0+A0oDn/Jd6rU+El7n43hDb9NC5R635uL2sV1v7FxC9H7aOrvNlC/sytWOpQ
	 qXLTHphVYcsn74r2/iJNHY3m3i9Zh+d1Y1ZEwsvFxlGCOVTucoeHvryAhDTjMHRNLl
	 PlD/63K9uksbI2llnoQXWpMOL6hO0Nvop3nMKqksoduHQiBax9q99+CK2KZ7zqitTo
	 T8E26XymbJv0E9n/Dxav6wElcTP+Hvj/ywtwaAoR2OIELiNk9MZc6WFXbQqDqtyPtM
	 mzz/tHTj6Zc2ggXrTI8Qq9VJ0+sarokp6/suZ+l0SSj/OKVQhmqGUDKj1d2mCZjFN9
	 Sf9hxwM5LeNZQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 00:26:10 +0200
Message-Id: <DKO63NHZUU47.27B9TJ6B1FB8N@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during
 probe
Cc: "Joel Fernandes" <joel@joelfernandes.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-5-jhubbard@nvidia.com>
 <DKO4XKBWD8W5.1K2R6QLREBJVG@kernel.org>
 <57d116ec-3288-490e-8b1f-480a87f1fa9f@nvidia.com>
In-Reply-To: <57d116ec-3288-490e-8b1f-480a87f1fa9f@nvidia.com>

On Thu Aug 13, 2026 at 11:43 PM CEST, John Hubbard wrote:
> On 8/13/26 2:31 PM, Danilo Krummrich wrote:
>> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
>>> Allocate a single PCI MSI interrupt vector in the probe path.
>>>
>>> Try MSI/MSI-X first. If that fails (possible in broken VFIO setups),
>>> fall back to INTx with a dev_warn so the issue is visible in dmesg.
>>> The allocation is devres-managed and automatically freed on unbind.
>>=20
>> [...]
>>=20
>>> +pub(crate) fn alloc_vector(pdev: &pci::Device<Bound>) -> Result<pci::I=
rqVector<'_>> {
>>> +    let msi_types =3D IrqTypes::default().with(IrqType::Msi).with(IrqT=
ype::MsiX);
>>=20
>> I was about to ask if we really need to bother with MSI and shouln't jus=
t go for
>> MSI-X only.
>
> I have an expensive, recent motherboard in my test machine, and it seems =
to only
> expose MSI for my Turing, Ampere and Blackwell GPUs, in the non-SRIOV con=
figuration.
> So I'm thinking that MSI-X only would not work.

Interesting, I just checked one of my Ada and one of my Ampere GPUs and nei=
ther
reports MSI-X in the capabilities. Other devices show up with MSI-X though.=
..

Are we sure it's not an endpoint limitation? I really thought it's not.

>> But then saw that the commit message mentions broken VFIO setups; can yo=
u expand
>> on this a bit? Which setups is the commit message referring to?
>
> On Zhi Wang's Big Branch of Everything, he is able to run Windows guests =
in a
> vGPU VM on top of nova-core. That system requires MSI-X. And I broke it w=
ith
> an earlier internal version of this patchset.
>
> That information probably leaked into my commit message here. I can remov=
e
> it. Because I don't think it is based on anything else.

So I guess we can also drop the INTx fallback? AFAIK SR-IOV VFs won't work =
with
INTx anyway.

>>> +
>>> +    let irq_vectors =3D match pdev.alloc_irq_vectors(1, 1, msi_types) =
{
>>> +        Ok(vecs) =3D> vecs,
>>> +        Err(_) =3D> {
>>> +            dev_warn!(pdev.as_ref(), "MSI not available, falling back =
to INTx\n");
>>> +            pdev.alloc_irq_vectors(1, 1, IrqTypes::default().with(IrqT=
ype::Intx))?
>>> +        }
>>> +    };
>>> +
>>> +    irq_vectors.vector(0)
>>> +}
