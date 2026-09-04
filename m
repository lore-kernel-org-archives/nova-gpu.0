Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF947D473;
	Fri,  4 Sep 2026 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523705; cv=none; b=rQ0jmY7wxcphomYKIVCnUicSyovF3KVc5dyjTs3OW+gP6EBdVO5tYNhk0R4vz9AhXpnmN6Vjpj+Uo/4i8k7IwHiBM3uygjt3Zf/A6wot2qvqvvq09J7Xc8BsGHx79d+YuehreC1hHZR83VTAHQ+vXiW94sZK8zLLO2Ic0c5XyVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523705; c=relaxed/simple;
	bh=0m7e+tQ8qovv1K2OpjbrtNZnKphh4c5v6qj+NA9RmBQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=u08xIeU0+Hoylf3bz58QoKx3CPKRezMmI6sFsCtiWW4xeSdpqHWSj1hrk4j9yXa3WjxVDE98UfOCJATFMI0jGen63jdpX42UDPf+/16gt/aEKvT36sry9w68N2sCBrEb1ni0kzzWlDbfAck/PZvOGT8TJbc120NeeDxJBQTeK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qlqbe0Sb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qlqbe0Sb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FACF1F00A3D;
	Fri,  4 Sep 2026 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788523703;
	bh=BwqAVmTr8KXY7ZWClt2GtVrlFHVmSKcB9c6H5LMm1z4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=Qlqbe0SbaU5fZwKxMYP3qPzbZIgKBjC7zNm40PQyLIy4NPBhN/wofr2FlS+/YpvYD
	 lZgLx6ufLNHf6/f+iv2QPYLFq+OQFTWrY36tUOZVfgryPGciVJdbbvR1dtwruSAPm0
	 ZobU84HZfhmu9SKW/DrNSMwYKtIswDa4NH/wT77nb2fmbnNGShIgfvt7MRnD21n1Gn
	 W4k+Oo4RPRzmobQhiCUTP6d8WRocFLW/GGa6izM290snHUYonFMIGB+M3D70MYMheE
	 GB/9KcNLhzXyABtGTEJ/Bqs1DpO5P6wJ0iugn+/T6kKT67fDSDF7gusFmM5r3Hh2lL
	 SGhKnRXXeBexw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 14:08:19 +0200
Message-Id: <DL6IQKQDXY7P.1F6PSERSJ64PN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
Cc: "Alistair Popple" <apopple@nvidia.com>, "nova-gpu"
 <nova-gpu@lists.linux.dev>, "M Henning" <mhenning@darkrefraction.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Benno Lossin"
 <lossin@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org>
 <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal>
 <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal>
 <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
 <DL6HKYRXHNFK.1D9HYNEPH4GCR@garyguo.net>
In-Reply-To: <DL6HKYRXHNFK.1D9HYNEPH4GCR@garyguo.net>

On Fri Sep 4, 2026 at 1:13 PM CEST, Gary Guo wrote:
> You mentioned in an earlier email about the typing, but we could still ha=
ve
> meaningful impl IDs fully typed like this:
>
>     pub enum Arch {
>         Turing(impl_id),
>         Ampere(impl_id),
>         ...
>     }
>
> and some langauges can do better, e.g. TypeScript allow you to write
>
>     enumn ArchId {
>         Turing,
>         Ampere,
>         ...
>     }
>
>     enum TuringImplId { ... }
>     enum AmpereImplId { ... }
>
>     type Id =3D
>         { arch: ArchId.Turing, impl: TuringImplId } |
>         { arch: ArchId.Ampere, impl: AmpereImplId };
>
> So I think it's a reasonable design to have it.

Of course we could encode this implementation detail, but I think there's n=
o
reason to do so.

For instance currently we refer to GA100 as

	Chipset::GA100

but with the above we'd refer to GA100 as

	Arch::Ampere(AmpereImpl::GA100)

which is not buying us anything, is it?

It also would be confusing because both the architecture and the specific c=
hip
would now be both represented by a type called Arch.

> True, but I think the chip ID is as bad as impl ID. Feature detections sh=
ould
> use dedicated featuire detection mechanism, not looking up IDs directly. =
I.e. we
> should have userspace not having to use either chip ID or impl ID as much=
 as we
> can.

This I agree with, which is also why I mentioned we should export SM if GSP
already provides it to us.

> That said, I do think looking up tables are unavoidable, for getting name=
s or
> applying some quirk fixes. And I agree with Alistair that if we include i=
t,
> including impl ID is better than the chip ID, as we should rather not hav=
ing
> user space relying on an arbitrary encoded chip ID.

No, the only thing userspace ever uses to distinguish between things is eit=
her
by architecture or by chip. If we instead provide architecture and some ID
userspace will just go

	if (arch =3D=3D Ampere && id =3D=3D 0)
		chip =3D GA100;
	else if (arch =3D=3D Ampere && id =3D=3D 2)
		chip =3D GA102;
	[...]

and after that never care about the ID again. Whereas with giving userspace=
 the
chip and architecture as separate fields userspace is done.
