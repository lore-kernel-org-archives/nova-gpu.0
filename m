Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093497;
	b=s6vMkY+eW2Xzifr8cjKMdyvGABajcEHD+Evi1SKKN51TQPCCkiN2jipeZscsukOt9+5T
	 QCtcawLkcWVspqllIspJXW2YBUSWO0x8hEQSDBdMLMtqHG5UIp0fXuFLsfFSV1yaR76VM
	 wyvcODjYGw/0GfspnZlv8BVUI0pzWjx72f3cbT+olJb+PRn0IbDjwv2It6znSF6QIhfEJ
	 DC8aMJ/qErfSIYjH/Yoky7o5CNr+s3/RxgH8QAzQ1WNbHOhel+Pnn7K+E+uygFArgwjFa
	 846qwhBJ18gv/sEw0Y/QrVYMc977xpt6eJM+lo/q+w9/fQmI31i11wvwJapBHeXw33Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093497;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=B+YhXZl+/eWRBv4RgozyREqWo5C8cExmqjC652z4jDc=;
	b=k+TtibECMBnpWn2iPGdwhgP4MwfTiL2HMtRlSxCLwDKHcN2adchccXsOA2sZhC0j9rDX
	 Zleu9pD4UKo7x5yPjy3hyWfaAfDHXf9ofIy5tQbxJDkJTer6Mj2iwbIgCq1jVHyLGUNOm
	 QIQI7VL97zSCs3e1+XZnWgJOK/lgkoeobPeKKqnExrIApAtjc3DnTNjsHsolsr5gG3q1C
	 W8cs6/TrmVP7RnZ9OruTsiEQ4CkqsIAzU3rd7ZqgdD7/H2oyYDNoImUIsP0lMyjBAvZQk
	 e855pGHEJqXeTBmrZe6pbAILdRTIOao+6dnrSZ1/gsUoyHCsQpHcAN6puq8hsG5aUhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMw1HOP4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3E606A326;
	Sat,  7 Nov 2026 23:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMw1HOP4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8C11F0089F;
	Sat,  7 Nov 2026 23:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794093496;
	bh=B+YhXZl+/eWRBv4RgozyREqWo5C8cExmqjC652z4jDc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=lMw1HOP4tnW3JvJhlRS8xA+R2LNpa3onQ1CAogENBEfkTxzwNmmROKB0asKESEdHa
	 LPIFeYVb3lS1Dz/iFj/qicZ3WDrRan1q0WmYQMKdOmySZWwKAyYqj5h3Ue0MzFgZ/+
	 9TEKM6luuvc7jGFr4RZoSECPhQJjVn1VcGYbIDdVIK36Rj6y6VKjavPgCBtGMT87ml
	 +f896MxhHF4w08uLf3NpmqjGiitdaHUvjreWODi0J4zt1FQxJkBFnQIyeV2izKbLu7
	 nGH2dRZ0aaKmytkZrSSMcmRvqg9Fzc9PBJjsNk4a8qe7s06vm5RyJTirG0+5Tf+6aF
	 UE3hcIKF20jDw==
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
Date: Sun, 08 Nov 2026 00:18:12 +0100
Message-Id: <DMPD2CDIAW74.2Q60A9JGEPTR2@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 1/3] gpu: nova-core: move the debugfs root into the
 module data
Cc: "Vladislav Zaharov" <vladazaharova2018@gmail.com>,
 <jhubbard@nvidia.com>, <aliceryhl@google.com>, <ttabi@nvidia.com>,
 <gary@garyguo.net>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
 <20261014154554.231015-2-vladazaharova2018@gmail.com>
 <DMOS00OZYWU5.2SUZRN37DEH87@nvidia.com>
 <DMP087IP6EDP.2QB7783SVNV2T@kernel.org>
 <DMP0LNXEI7YF.1G8UBZKO2W3U9@nvidia.com>
In-Reply-To: <DMP0LNXEI7YF.1G8UBZKO2W3U9@nvidia.com>

On Sat Nov 7, 2026 at 2:32 PM CET, Alexandre Courbot wrote:
> On Sat Nov 7, 2026 at 10:14 PM JST, Danilo Krummrich wrote:
>> On Sat Nov 7, 2026 at 7:47 AM CET, Alexandre Courbot wrote:
>>> On Thu Oct 15, 2026 at 12:45 AM JST, Vladislav Zaharov wrote:
>>> Another thing: since this is declaring now a proper interface, can you
>>> move `DebugfsData`, `debugfs_data` and `DEBUGFS_DATA` into a sub-module=
,
>>> say `debugfs.rs`?
>>
>> I think that makes sense.
>>
>>>>  impl InPlaceModule for NovaCoreModule {
>>>>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self=
, Error> {
>>>> -        let dir =3D debugfs::Dir::new(c"nova-core");
>>>> -
>>>> -        // SAFETY: We are the only driver code running during init, s=
o there
>>>> -        // cannot be any concurrent access to `DEBUGFS_ROOT`.
>>>> -        unsafe { DEBUGFS_ROOT =3D Some(dir) };
>>>> -
>>>>          try_pin_init!(Self {
>>>> +            _debugfs <- DebugfsData::new(),
>>>> +            _: {
>>>> +                // SAFETY: Nothing reads `DEBUGFS_DATA` before a devi=
ce is bound, which cannot
>>>> +                // happen until the driver is registered below. What =
it points at is dropped only
>>>> +                // once the driver is unregistered, so it is valid fo=
r as long as any device is
>>>> +                // bound, and nothing reads it outside of that.
>>>> +                unsafe { DEBUGFS_DATA =3D &*_debugfs };
>>>> +            },
>>>
>>> Let's move this initialization into `DebugfsData::new`, using
>>> `pin_chain`:
>>>
>>>     /// Returns an initializer that creates the shared debugfs data.
>>>     ///
>>>     /// # Safety
>>>     ///
>>>     /// The returned initializer must be run exactly once before the dr=
iver is registered. The
>>>     /// initialized [`DebugfsData`] must outlive the driver registratio=
n.
>>>     pub(super) unsafe fn new() -> impl PinInit<Self> {
>>>         pin_init!(Self {
>>>             root: debugfs::Dir::new(c"nova-core"),
>>>         })
>>>         .pin_chain(|debugfs| {
>>>             // SAFETY: Per the method's safety block, the driver is not=
 registered yet, meaning that
>>>             // no device can be probed and thus nothing can access `DEB=
UGFS_DATA` concurrently.
>>>             //
>>>             // INVARIANT: Per the method's safety block, `DEBUGFS_DATA`=
 is written before the driver
>>>             // is registered and points to a valid instance of `Debugfs=
Data`, which is pinned
>>>             // and dropped after the driver is unregistered.
>>>             unsafe { DEBUGFS_DATA =3D &*debugfs };
>>>             Ok(())
>>>         })
>>>     }
>>>
>>> That way, the burden of enforcing the invariants for `DEBUGFS_DATA`
>>> relies exclusively on `new` (and we made it unsafe to force the caller
>>> to do that).
>>
>> Actually, I would leave that part as is.
>>
>> Eventually we'll have registration data for driver registrations to shar=
e module
>> data. Once we have that, we'd need to change DebugfsData::new() again an=
d move
>> that part bnack into NovaCoreModule::init().
>>
>> Besides that, DebugfsData has nothing to do with the current limitation =
of
>> publishing module data to driver registrations; the module code seems li=
ke the
>> correct place to deal with this.
>
> Makes sense, let's reduce the churn indeed. In this case I guess
> `DEBUGFS_DATA` will need to be made `pub(super)` so this module can
> initialize it.

I think DEBUGFS_DATA still belongs into nova_core.rs (including the
debugfs_data() accessor) since it is a workaround to make module data
accessible.

I'd also like the accessor to be an associated function:
NovaCoreModule::debugfs_data().

Thanks,
Danilo
