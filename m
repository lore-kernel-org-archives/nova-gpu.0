Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057282;
	b=BOZFLAnqm3lf07j+q/vOKARrMQ65fK4y8/vMKQr2EjmVI+YITciInCQ2ohHS5QF8QhuF
	 jb+nP3Pou5YslZ4cZqMcjTiEO895V1Qe/YhCvZQD3fpfCnZ/sC1ALv0+I5A/Vgz0MiPE9
	 MkV9eGf8c7ShiwZudQ5okTguBW/r9hPbyQDJD5szhRbB48bX4itVrxVZRV875+QRp1aKF
	 4GZTJBCGFCfzJKuE18JDZFwrGgolzjCNhL5eqabvhPmP4Bf2rZLg44ZVHcGhc2L1IIFxB
	 sQSsueET7Uz+901iuqPaTa7XxBBZloW0aF3QzRiEzSpQP9izz/+qJV9RhO7IkcAWnQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057282;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=88MbdADXOG95yPaprGDH5zGpBHryNNftoLItksx3UfI=;
	b=Tvd/OgV7y7XMvy2EPGiWslPp3xnrHlymtGiO1avgRxlVZqk1IzxsjBUfn4QkRU9u8Nde
	 LjqKiDgpurWQm8yPJivskuY2R6cJtcRdbjRVXMJOcfFG/UvB9lTriJt0Fw2+5W+PYj/f6
	 afZECWFwrs2/+pFYv6TEQFvLCuEwaCSXK8idYsX9p4PDloK6YWo2RQ+LePCcBjVLkPaax
	 lGyjdFo6Y+qZ6PeRX13dpFWOr+6hF5MDUlAh00lPEJj+3wFpfmcwbiVzS37t56B0CBwkf
	 CTLTkqWBIkobMQHrbiPjgMYFCIITjkqTsN/UuQqdAQwZXFq5Woa2hC8xP5Ghv3CzsOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXwNqbZa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA0606A326;
	Sat,  7 Nov 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXwNqbZa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF7F1F0089F;
	Sat,  7 Nov 2026 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794057281;
	bh=88MbdADXOG95yPaprGDH5zGpBHryNNftoLItksx3UfI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=OXwNqbZaqposPaEv17apZCrV2blKgc6UovQ4cEFyZvgayV3ejh0wh2afMkoBIwbCB
	 sGvZ5SQB/xsnM8LsBmq4CuI0975MGm9Rs8QE2iMkgei6G61y+kBmwS73Rj34QptL9l
	 7QaMbc5m9EuffboWvwdC442AZgcVyN6gmjFxpfBshTxxWMA+inkeSzhBjEIzAravT/
	 yQlcJWH77cHJmAX8yNlz9z3Y5+s9bji/LSBk95bgQvY3PhwLbAmkJcB52WxrEZwqan
	 9M3vuiQ+4Jhspa8i32K9xYapk0b+9JGWHnnnXledkM6PPPlZqJ+z2Mh3V1M23LwnUL
	 4m54kRac5Tg6w==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 14:14:37 +0100
Message-Id: <DMP087IP6EDP.2QB7783SVNV2T@kernel.org>
Subject: Re: [PATCH v6 1/3] gpu: nova-core: move the debugfs root into the
 module data
Cc: "Vladislav Zaharov" <vladazaharova2018@gmail.com>,
 <jhubbard@nvidia.com>, <aliceryhl@google.com>, <ttabi@nvidia.com>,
 <gary@garyguo.net>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
 <20261014154554.231015-2-vladazaharova2018@gmail.com>
 <DMOS00OZYWU5.2SUZRN37DEH87@nvidia.com>
In-Reply-To: <DMOS00OZYWU5.2SUZRN37DEH87@nvidia.com>

On Sat Nov 7, 2026 at 7:47 AM CET, Alexandre Courbot wrote:
> On Thu Oct 15, 2026 at 12:45 AM JST, Vladislav Zaharov wrote:
> Another thing: since this is declaring now a proper interface, can you
> move `DebugfsData`, `debugfs_data` and `DEBUGFS_DATA` into a sub-module,
> say `debugfs.rs`?

I think that makes sense.

>>  impl InPlaceModule for NovaCoreModule {
>>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, =
Error> {
>> -        let dir =3D debugfs::Dir::new(c"nova-core");
>> -
>> -        // SAFETY: We are the only driver code running during init, so =
there
>> -        // cannot be any concurrent access to `DEBUGFS_ROOT`.
>> -        unsafe { DEBUGFS_ROOT =3D Some(dir) };
>> -
>>          try_pin_init!(Self {
>> +            _debugfs <- DebugfsData::new(),
>> +            _: {
>> +                // SAFETY: Nothing reads `DEBUGFS_DATA` before a device=
 is bound, which cannot
>> +                // happen until the driver is registered below. What it=
 points at is dropped only
>> +                // once the driver is unregistered, so it is valid for =
as long as any device is
>> +                // bound, and nothing reads it outside of that.
>> +                unsafe { DEBUGFS_DATA =3D &*_debugfs };
>> +            },
>
> Let's move this initialization into `DebugfsData::new`, using
> `pin_chain`:
>
>     /// Returns an initializer that creates the shared debugfs data.
>     ///
>     /// # Safety
>     ///
>     /// The returned initializer must be run exactly once before the driv=
er is registered. The
>     /// initialized [`DebugfsData`] must outlive the driver registration.
>     pub(super) unsafe fn new() -> impl PinInit<Self> {
>         pin_init!(Self {
>             root: debugfs::Dir::new(c"nova-core"),
>         })
>         .pin_chain(|debugfs| {
>             // SAFETY: Per the method's safety block, the driver is not r=
egistered yet, meaning that
>             // no device can be probed and thus nothing can access `DEBUG=
FS_DATA` concurrently.
>             //
>             // INVARIANT: Per the method's safety block, `DEBUGFS_DATA` i=
s written before the driver
>             // is registered and points to a valid instance of `DebugfsDa=
ta`, which is pinned
>             // and dropped after the driver is unregistered.
>             unsafe { DEBUGFS_DATA =3D &*debugfs };
>             Ok(())
>         })
>     }
>
> That way, the burden of enforcing the invariants for `DEBUGFS_DATA`
> relies exclusively on `new` (and we made it unsafe to force the caller
> to do that).

Actually, I would leave that part as is.

Eventually we'll have registration data for driver registrations to share m=
odule
data. Once we have that, we'd need to change DebugfsData::new() again and m=
ove
that part bnack into NovaCoreModule::init().

Besides that, DebugfsData has nothing to do with the current limitation of
publishing module data to driver registrations; the module code seems like =
the
correct place to deal with this.
