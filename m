Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048813E1D06;
	Thu,  9 Jul 2026 22:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783636114; cv=none; b=u36mk9yuCSeK+ufEfgtoJ9ghLzxjGFvKSZ4L0iycQBUuTsz/NBmk52eRBk0xkH2kt7Jdc/CwSklcv0Cjw9ZKtnz4DH0zt8Oy87vBJZYRKnGv8yGdvJ32bjxrQJLKIGoFbvEfCx3L7ZYNgEK7wcohogANVU70Euj8DZo6zNdMrCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783636114; c=relaxed/simple;
	bh=AMMNjXoun6wqT7XIixDF59SxSI/Thy6rr5NMBz2MnZI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jJjjWEzpKzPQTBI6PcUQdHnz7KoD2Xt2/awU6S2RRexKBKZpqkFlrNggfikPcSpNmAALsyol27jFjj0DLRlJ2CXGHpRgHbJHgLauv60LYp7DGnV5tH6AdQAPD1kwLe7KH4gN2f1r1Tjiae12AimNYYSpjkLy1pDt9jxpgijOfD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLF7UXzC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLF7UXzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221671F000E9;
	Thu,  9 Jul 2026 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783636111;
	bh=HvFvqP2r78cOv6Xhyh4nGbfLWs8LKp9PI5pboFlC2GI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=gLF7UXzC2VsFlfl26aPNjrRF3wu0n5q71lbMUZsO58IUqg9thLbJwkABzuddIHsRX
	 GvHgFhe1iFaxqP6gAbCS9W9PVu4ybbcwhvOqh5ZNGQyvV4dLkMfdSITasU3ag12JMN
	 9zaK9YlNswxafF6Ye+/O9T8qGygX0iyb3+FJN5d8T85dP6+TdcZMM0/Va1UeyuuDTK
	 9TylV8e0Gvk8Ywt/LVaxQ+xI2ORwvvcLbjdxPrE3+S5O3gKbP+vcHZdlNDoop4+rXF
	 7DbnEVEl02z3x7IF8uV9QqPCg1cQhFBTBarCq9jyrZLmz9H6uTcCDfK8YXYMcv59pL
	 9MS012I7me8+g==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 00:28:27 +0200
Message-Id: <DJUE8BYTRI82.29EEOWULQ2T8G@kernel.org>
Subject: Re: [PATCH v2 3/5] drm: nova: Add GETPARAM parameter to read the
 GPU chipset
Cc: "Alistair Popple" <apopple@nvidia.com>, <nova-gpu@lists.linux.dev>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260709085204.565159-1-apopple@nvidia.com>
 <20260709085204.565159-4-apopple@nvidia.com>
 <DJU1LZQLJ38P.2OHWQWKDYJ86J@nvidia.com>
In-Reply-To: <DJU1LZQLJ38P.2OHWQWKDYJ86J@nvidia.com>

On Thu Jul 9, 2026 at 2:35 PM CEST, Alexandre Courbot wrote:
> On Thu Jul 9, 2026 at 5:52 PM JST, Alistair Popple wrote:
>> @@ -82,39 +83,39 @@ fn try_from(value: u32) -> Result<Self, Self::Error>=
 {
>> =20
>>  define_chipset!({
>>      // Turing
>> -    TU102 =3D 0x162,
>> -    TU104 =3D 0x164,
>> -    TU106 =3D 0x166,
>> -    TU117 =3D 0x167,
>> -    TU116 =3D 0x168,
>> +    TU102 =3D uapi::drm_nova_chipset_NOVA_DRM_CHIPSET_TU102,
>> +    TU104 =3D uapi::drm_nova_chipset_NOVA_DRM_CHIPSET_TU104,
>> +    TU106 =3D uapi::drm_nova_chipset_NOVA_DRM_CHIPSET_TU106,
>> +    TU117 =3D uapi::drm_nova_chipset_NOVA_DRM_CHIPSET_TU117,
>> +    TU116 =3D uapi::drm_nova_chipset_NOVA_DRM_CHIPSET_TU116,
>
> If we are going to remove the actual values, let's at least generate the
> right-hand side in the macro as it is just verbose without bringing any
> new information. The following diff lets you remove the `=3D uapi::...`
> for each chipset declaration.

I was about to propose the same thing, the right-hand side is just noise.

> The UAPI definitions come technically from nova-drm (and are defined as
> such), which introduces a dependency of sorts from nova-core to
> nova-drm. I'm not saying this is a problem, but mentioning it as we want
> to make that decision consciously.

It is the other way around, both nova-core (mostly indirectly) and nova-drm
(directly) implement the uAPI contract and hence obviously depend on this
contract.

The chipset value that is exposed to userspace is produced by nova-core, no=
t by
nova-drm; nova-drm just passes it through.

So, this is not a "we randomly reuse the uAPI enum" kind of situation, it i=
s
more about making nova-core commit to the contract that it has to uphold.

> I also think the introduction of UAPI variants and modification of
> `define_chipset` should be its own patch, as these are pretty
> mechanical.

Yes, it should be.

Thanks,
Danilo
