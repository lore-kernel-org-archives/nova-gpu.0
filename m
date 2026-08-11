Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19E7260D;
	Tue, 11 Aug 2026 23:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786492614; cv=none; b=kqWwTLYT58dXXNBV1NvJyCl55CNlCOSiVtGaFYPfs53/73fx69xJR8JV8M4uTdvxeoIHkScav29w9Q0vNAiWW2SgWufGp1kEvgE+fhUq7l8Z36aTfeuDUk22bvjA1B1War5NC4+bjarkx1M8GEJoMAKF351/y4tYR1HZOnrZTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786492614; c=relaxed/simple;
	bh=uKMa/ub/G6pzi1SriN6ySG7tkUN6WF/VGaRWgg8qA8w=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=ceDR3xLA61MGOzT93BeRqHjCzqDNkdDkpQljfXRbZoauRyxKC/CZsX22aJf1Sdo2M3cJAmsa53tNjRKaO25JjHhaXnsDi6nxYF+VrfL3X0TVn/On6bLvWCJsLcqxLiGzKai4uU+CyRAgRHsHKUbrikYCxvYB9j+38x9XZ0uVOE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KL8v1lhH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KL8v1lhH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664481F000E9;
	Tue, 11 Aug 2026 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492613;
	bh=nI75wCHuPAIGl+LjrGpjbMMM3+ASoUPkNSLTJDJ6zDo=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=KL8v1lhHjN3NwSqcgtRtkoQ04jJpYfd8squLoN6KtFtgV93+1qWapflD9IdQX3rKU
	 9sgPQ9p71cuDs+At8TZQBe4nTh/ENFCCIWFo10yWA19k9MYSXfFIALt9WmTiZEDKJ0
	 B52HtdhgoUeJr0r2inpl4bbbg2CdeZBSrqp8V4o1+VInywrFW8k4ApCQ0naD5qpeO7
	 ddVqAmy2qfD2f3EPDCMeWtS/VnZ9U3QqzkeVga7npPq2VwEO2bGLD7dWvzp+bQMatG
	 8tqUAJqXhgZeTzNBhtWj38PyZ1SPFoD/wsey1B+E9y7GswBfLn9IOaRLSVX4WxQg4P
	 aY0zmvDDDW9Dw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 01:56:48 +0200
Message-Id: <DKMIRY6WMUPL.FW2S62K4GIUB@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 03/17] rust: pci: expose the allocated interrupt type
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
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-4-jhubbard@nvidia.com>
 <DKKG2QM3YJYB.Z2H2B2UXJ75N@kernel.org>
 <e2aa36cb-984a-4f8a-b6d5-6cb70a31a30b@nvidia.com>
 <DKLMSULDBL2C.1JSX46NQDH1JU@kernel.org>
 <6d08c833-adea-4b34-a9eb-457cc4fc0ba3@nvidia.com>
In-Reply-To: <6d08c833-adea-4b34-a9eb-457cc4fc0ba3@nvidia.com>

On Tue Aug 11, 2026 at 5:09 AM CEST, John Hubbard wrote:
> On 8/10/26 3:53 PM, Danilo Krummrich wrote:
>> On Sun Aug 9, 2026 at 11:42 PM CEST, John Hubbard wrote:
>>> Yes, please. Then my patches 2 and 3 collapse into a single patch that
>>> adds count(), irq_type() and an index-to-IrqVector accessor. Or, they g=
o
>>> away entirely if you end up putting those on the type yourself.
>>=20
>> I sent out a patch series [1] for this, applied your nova-core patches o=
n top of
>> it and resolved the conflicts with the diff below (also pushed a branch =
in [2]).
>>=20
>> Note that I optimized for a clean diff and not for optimal code. I think=
 there
>> are more improvements we can make; I will comment on the corresponding p=
atches
>> of this series.
>
> I've folded your series and the fixups into a v2 work-in-progress branch,=
 here:
>
>     https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tre=
e-v2
>
> Let me know if it would be better for me to post that now, given that the
> earlier parts are all different now.

Thanks! I think it's fine as is, will go over the series on Thursday.

I've sent a v2 (and updated the branch I shared previously), as I think
preserving the source of IRQ via the anchor type doesn't really add a lot o=
f
value and keeping IrqVector as a new type over IrqRequest turns out nicer. =
The
changes required from v1 to v2 should be minimal.
