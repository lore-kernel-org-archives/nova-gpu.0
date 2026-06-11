Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB483E63B7
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 18:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204022; cv=none; b=VBMZm+0n8CHPliqydwYDu1pGvOHyJu9GjvWhM4+zPbM1qLJ+7mRC9LaKUJbj+Igx9rr8ghSF0PeRn8LA4PZVRELsafqC8idYVQrz5jKHI8TugGVgF021jUcTCvLcyEOjKnU0UKHngYhu42Cf1FmEF7Z6kdq3ps3W8nMYv/he+5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204022; c=relaxed/simple;
	bh=43EYTtos5GBocJiOZEylriN50tByvSPVOwb4T1tAK9U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WpWiSyjNbOJWmqrhfKFPYkKp0EbUeEQkreIo8FdLNQB5jIuS35kKJcnHNS+Z2RjtK4Mm1Ky470UwHDf0hw7R5A2PdVa0Tgr5OYUeOcvsnIVcLvvCj5tJBtO7jvN92G/Wllhrgdp/w6UE3nXnURUeEk1O1LvqJgwvFV1CAd/ZJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPB6tiA2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPB6tiA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64421F000E9;
	Thu, 11 Jun 2026 18:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781204019;
	bh=wHOd2b6X5BvxSbs+ggGzRbAZqdJRBhKzicAc6zvfJ1A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=CPB6tiA2Zol3e27qNMM7jkNOfl8aBjhls8hQiEWMBMY/PThqw43e07AKKhgNefl2P
	 js4vORyNZWBNqUnxlqd9hA8AuUIBv6Ho1QODGeaoeUKNBvvSZx3GGFmE/oOOptE3nY
	 ertwsOcGfLQMgni/8atwAH2KNLLmiVf3vaHOo2TWpWcPXRmtRTvJ5p5NmfFZoe6iuV
	 HgrpwnyxYrdcEcDEHaOa0FfveBaPljGOEU3b9N6EmkqGNkQ5KUR7aa/+DVAV67agGg
	 loGNugv1K9WZuSkZ7xT3a2CyRUz5+rBjjVe9GNfA1GmEfnkywEou9JDgxBE7m1sIjQ
	 mhPyWi76PHZKg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 20:53:36 +0200
Message-Id: <DJ6G4KOFPORH.3UBTDZK1MFIC4@kernel.org>
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-3-ttabi@nvidia.com>
 <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
 <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
In-Reply-To: <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>

On Thu Jun 11, 2026 at 6:45 PM CEST, Timur Tabi wrote:
> On Thu, 2026-06-11 at 00:00 +0200, Danilo Krummrich wrote:
>
>>=20
>> > diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core=
/firmware.rs
>> > index 279fbacd0b8e..2749c196416d 100644
>> > --- a/drivers/gpu/nova-core/firmware.rs
>> > +++ b/drivers/gpu/nova-core/firmware.rs
>> > @@ -33,9 +33,11 @@
>> > =C2=A0pub(crate) mod gsp;
>> > =C2=A0pub(crate) mod riscv;
>> > =C2=A0
>> > +#[allow(unused)]
>>=20
>> This shouldn't be needed, it can just be removed when once it becomes un=
used,
>> no?
>
> Technically, yes.  As a convenience, I removed it here so that I wouldn't=
 have to worry about it
> in a later patch.  I find that the patches themselves are cleaner that wa=
y.  I don't want to
> have a patch where the only change to firmware.rs is adding or removing t=
he `unused` statement.

You remove FIRMWARE_VERSION in patch 8 together with its (last) user, so ad=
ding
#[allow(unused)] here in unnecessary. Am I missing anything?

>>=20
>> > =C2=A0pub(crate) const FIRMWARE_VERSION: &str =3D "570.144";
>> > =C2=A0
>> > =C2=A0/// Requests the GPU firmware `name` suitable for `chipset`, wit=
h version `ver`.
>> > +#[allow(unused)]
>> > =C2=A0fn request_firmware(
>> > =C2=A0=C2=A0=C2=A0=C2=A0 dev: &device::Device,
>> > =C2=A0=C2=A0=C2=A0=C2=A0 chipset: gpu::Chipset,
>> > @@ -48,6 +50,21 @@ fn request_firmware(
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .and_then(|path| firm=
ware::Firmware::request(&path, dev))
>> > =C2=A0}
>> > =C2=A0
>> > +/// Requests the GPU firmware TLV `name` suitable for `chipset`.
>> > +#[allow(unused)]
>>=20
>> Please use expect instead.
>
> Ok, but why should I use `expect` here but `allowed` is for FIRMWARE_VERS=
ION?  As soon as I use
> request_tlv() in patch #4, won't get I get a compiler warning and be forc=
ed to change it to
> `allow`?

Gary already explained it very well.

Thanks,
Danilo
